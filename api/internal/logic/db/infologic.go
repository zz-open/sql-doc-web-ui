package db

import (
	"context"
	"errors"
	"fmt"
	"github.com/duke-git/lancet/v2/mathutil"
	"github.com/zzopen/mysqldoc/src/common/query"
	"github.com/zzopen/mysqldoc/src/common/response"
	"github.com/zzopen/mysqldoc/src/internal/svc"
	"github.com/zzopen/mysqldoc/src/internal/types"
	"strconv"
)

type InfoLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

type infoResp struct {
	Username                       string `json:"username"`
	Host                           string `json:"host"`
	Port                           string `json:"port"`
	DbName                         string `json:"db_name"`
	TableCount                     string `json:"table_count"`
	Version                        string `json:"version"`
	DefaultCharacterSetName        string `json:"default_character_set_name"`
	DefaultCollationName           string `json:"default_collation_name"`
	ThreadsRunning                 string `json:"threads_running"`                     // 激活的（非睡眠状态）线程数
	ThreadsConnected               string `json:"threads_connected"`                   // 当前打开的连接的数量
	MaxConnections                 string `json:"max_connections"`                     // 总连接数上限
	Uptime                         string `json:"uptime"`                              // 服务器已经运行的时间（以秒为单位）
	InnodbBufferPoolPagesTotal     string `json:"innodb_buffer_pool_pages_total"`      // 总页数
	InnodbBufferPoolPagesDirty     string `json:"innodb_buffer_pool_pages_dirty"`      // 脏页数目
	InnodbBufferPoolPagesDirtyRate string `json:"innodb_buffer_pool_pages_dirty_rate"` // 脏页数目比例
	InnodbBufferPoolPagesFree      string `json:"innodb_buffer_pool_pages_free"`       // 空闲页数
	InnodbBufferPoolPagesFreeRate  string `json:"innodb_buffer_pool_pages_free_rate"`  // 空闲页数比例
}

func NewInfoLogic(ctx context.Context, svcCtx *svc.ServiceContext) *InfoLogic {
	return &InfoLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

// Info /api/db/info 获取database信息
func (l *InfoLogic) Info(req *types.DbInfoRequest) (resp *response.ApiResponse, err error) {
	if req.DbName == "" {
		return nil, errors.New("数据库名称必传")
	}

	versionInfo := query.GetMysqlVersion(l.svcCtx.SqlxDb)

	databaseInfoSql := fmt.Sprintf("SELECT * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME= '%s'", req.DbName)
	databaseMap := query.ScanMap(l.svcCtx.SqlxDb, databaseInfoSql)
	if databaseMap == nil || databaseMap[0]["SCHEMA_NAME"] == "" {
		return nil, errors.New("数据库不存在")
	}

	res := &infoResp{
		Username:                l.svcCtx.Config.Mysql.Username,
		Host:                    l.svcCtx.Config.Mysql.Host,
		Port:                    l.svcCtx.Config.Mysql.Port,
		DbName:                  l.svcCtx.Config.Mysql.DbName,
		Version:                 versionInfo,
		DefaultCharacterSetName: databaseMap[0]["DEFAULT_CHARACTER_SET_NAME"],
		DefaultCollationName:    databaseMap[0]["DEFAULT_COLLATION_NAME"],
	}

	tableCountSql := fmt.Sprintf("SELECT count(*) as table_count from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA= '%s'", req.DbName)
	tableCountMap := query.ScanMap(l.svcCtx.SqlxDb, tableCountSql)
	if tableCountMap != nil {
		res.TableCount = tableCountMap[0]["table_count"]
	}

	maxConnectionsSql := fmt.Sprintf("SHOW VARIABLES LIKE 'max_connections'")
	maxConnectionsMap := query.ScanMap(l.svcCtx.SqlxDb, maxConnectionsSql)
	if maxConnectionsMap != nil && maxConnectionsMap[0]["Variable_name"] == "max_connections" {
		res.MaxConnections = maxConnectionsMap[0]["Value"]
	}

	showStatusSql := fmt.Sprintf("SHOW STATUS")
	statusMap := query.ScanMap(l.svcCtx.SqlxDb, showStatusSql)
	if statusMap != nil {
		for _, v := range statusMap {
			if v["Variable_name"] == "Uptime" {
				res.Uptime = v["Value"]
				continue
			}

			if v["Variable_name"] == "Innodb_buffer_pool_pages_total" {
				res.InnodbBufferPoolPagesTotal = v["Value"]
				continue
			}

			if v["Variable_name"] == "Innodb_buffer_pool_pages_dirty" {
				res.InnodbBufferPoolPagesDirty = v["Value"]
				continue
			}

			if v["Variable_name"] == "Innodb_buffer_pool_pages_free" {
				res.InnodbBufferPoolPagesFree = v["Value"]
				continue
			}

			if v["Variable_name"] == "Threads_running" {
				res.ThreadsRunning = v["Value"]
				continue
			}

			if v["Variable_name"] == "Threads_connected" {
				res.ThreadsConnected = v["Value"]
				continue
			}
		}

		var pagesTotal uint64
		var pagesFree uint64
		var pagesDirty uint64
		if res.InnodbBufferPoolPagesTotal != "0" {
			pagesTotal, _ = strconv.ParseUint(res.InnodbBufferPoolPagesTotal, 10, 64)
		} else {
			pagesTotal = 0
		}

		if res.InnodbBufferPoolPagesFree != "0" {
			pagesFree, _ = strconv.ParseUint(res.InnodbBufferPoolPagesFree, 10, 64)
		} else {
			pagesFree = 0
		}

		if res.InnodbBufferPoolPagesDirty != "0" {
			pagesDirty, _ = strconv.ParseUint(res.InnodbBufferPoolPagesDirty, 10, 64)
		} else {
			pagesDirty = 0
		}

		res.InnodbBufferPoolPagesFreeRate = fmt.Sprintf("%.2f", mathutil.Percent(float64(pagesFree), float64(pagesTotal), 0))
		res.InnodbBufferPoolPagesDirtyRate = fmt.Sprintf("%.2f", mathutil.Percent(float64(pagesDirty), float64(pagesTotal), 0))
	}

	return response.SuccessWithData(res), nil
}
