package table

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/zzopen/sql-doc-web-ui/server/common/query"

	"github.com/jmoiron/sqlx"

	"github.com/zzopen/sql-doc-web-ui/server/common/response"
	"github.com/zzopen/sql-doc-web-ui/server/common/utils"
	"github.com/zzopen/sql-doc-web-ui/server/internal/db"
	"github.com/zzopen/sql-doc-web-ui/server/internal/svc"
	"github.com/zzopen/sql-doc-web-ui/server/internal/types"
)

type ListLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
	conn   *sqlx.DB
}

type tableInfo struct {
	Name      string              `json:"name"`
	Engine    string              `json:"engine"`
	Rows      string              `json:"rows"`
	Comment   string              `json:"comment"`
	CreateSql string              `json:"create_sql"`
	Columns   []map[string]string `json:"columns"`
}

func NewListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *ListLogic {
	return &ListLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

// List /api/table/list 获取某个数据库下的所有表信息
func (l *ListLogic) List(req *types.TableListRequest) (resp *response.ApiResponse, err error) {
	var res = make([]*tableInfo, 0)
	if req.DbName == "" {
		return nil, errors.New("数据库名称必传")
	}

	databaseInfoSql := fmt.Sprintf("SELECT * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME= '%s'", req.DbName)
	databaseMap := query.ScanMap(l.svcCtx.SqlxDb, databaseInfoSql)
	if databaseMap == nil || databaseMap[0]["SCHEMA_NAME"] == "" {
		return nil, errors.New("数据库不存在")
	}

	conn, err := db.NewSqlxDb(db.NewDbConfigByDbName(l.svcCtx.Config, req.DbName))
	if err != nil || conn == nil {
		return nil, errors.New(err.Error())
	}

	l.conn = conn
	var exportSqlBuffer bytes.Buffer
	// 首先通过SHOW TABLE STATUS from 数据库名称语句 查询所有的表信息，可惜没有返回建表语句
	tableStatusSqlStr := fmt.Sprintf("SHOW TABLE STATUS from %s", req.DbName)
	tableList := query.ScanMap(l.conn, tableStatusSqlStr)
	if tableList == nil {
		return response.SuccessWithData(res), nil
	}

	if l.svcCtx.Config.GenerateSqlFile {
		versionInfo := query.GetMysqlVersion(l.conn)
		exportSqlBuffer.WriteString(fmt.Sprintf(
			`# ************************************************************
# Mysqldoc SQL dump
#
# 主机: %s (%s)
# 数据库: %s
# 生成时间: %s
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
`, l.svcCtx.Config.Mysql.Host, versionInfo, req.DbName, time.Now().Format(time.DateTime)))

	}

	for _, value := range tableList {
		tableName := value["Name"]
		tableInfo := &tableInfo{
			Name:    tableName,
			Engine:  value["Engine"],
			Rows:    value["Rows"],
			Comment: value["Comment"],
		}

		// 循环查询每个表的字段
		tableColumnSqlStr := fmt.Sprintf("SHOW FULL FIELDS FROM %s", tableName)
		tableInfo.Columns = query.ScanMap(l.conn, tableColumnSqlStr)
		// 循环查询每个表的建表语句
		createSql := l.getCreateTableStr(tableName)
		if createSql != "" {
			tableInfo.CreateSql = createSql
			if l.svcCtx.Config.GenerateSqlFile {
				exportSqlBuffer.WriteString(fmt.Sprintf("# ------------------------------------------------------------\n\nDROP TABLE IF EXISTS `%s`;\n\n", tableName))
				exportSqlBuffer.WriteString(tableInfo.CreateSql + "\n\n")
			}
		}

		res = append(res, tableInfo)
	}

	if l.svcCtx.Config.GenerateSqlFile {
		exportSqlBuffer.WriteString(
			`\n\n\n\n\n\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
		/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
		/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
		/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
		/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
		/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
`)
		l.createSqlFile(req.DbName, exportSqlBuffer.String())
	}

	return response.SuccessWithData(res), nil
}

func (l *ListLogic) getCreateTableStr(tableName string) string {
	if tableName == "" {
		return ""
	}

	createTableSqlStr := fmt.Sprintf("SHOW CREATE TABLE %s", tableName)
	queryMap := query.ScanMap(l.conn, createTableSqlStr)
	if len(queryMap) == 0 {
		return ""
	}

	res := queryMap[0]["Create Table"]
	// 去掉敏感信息
	res = utils.StringRegexpReplace(res, `AUTO_INCREMENT=\d+`, "") + ";"
	return res
}

func (l *ListLogic) createSqlFile(dbName string, content string) bool {
	// 暂定创建到程序执行目录下
	f, err := os.Create(fmt.Sprintf("%s/%s.sql", utils.GetPwdPath(), dbName))
	if err != nil {
		log.Println(err.Error())
		return false
	}

	defer f.Close()
	_, err = f.WriteString(content)
	if err != nil {
		log.Println(err.Error())
		return false
	}

	return true
}
