package db

import (
	"context"
	"github.com/zzopen/mysqldoc/src/common/logx"
	"github.com/zzopen/mysqldoc/src/common/response"
	"github.com/zzopen/mysqldoc/src/internal/svc"
)

type ListLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

type database struct {
	Name   string   `json:"name"`
	Tables []*table `json:"tables"`
}

type table struct {
	Name string `json:"name"`
}

func NewListLogic(ctx context.Context, svcCtx *svc.ServiceContext) *ListLogic {
	return &ListLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

// List /api/db/list 获取所有的数据库和表名
func (l *ListLogic) List() (resp *response.ApiResponse, err error) {
	var res = make(map[string]*database)
	sql := "select `TABLE_SCHEMA`,`TABLE_NAME` from information_schema.TABLES where `TABLE_TYPE` = 'BASE TABLE'"
	rows, err := l.svcCtx.SqlxDb.Queryx(sql)
	if err != nil {
		return nil, err
	}

	for rows.Next() {
		d := make(map[string]any)
		err := rows.MapScan(d)
		if err != nil {
			logx.Logger.Error(err.Error())
			continue
		}

		dbName := ""
		tableName := ""
		if str, ok := d["TABLE_SCHEMA"].([]uint8); ok {
			dbName = string(str)
		}

		if str, ok := d["TABLE_NAME"].([]uint8); ok {
			tableName = string(str)
		}

		if _, ok := res[dbName]; !ok {
			res[dbName] = &database{Name: dbName}
		}

		res[dbName].Tables = append(res[dbName].Tables, &table{Name: tableName})
	}

	return response.SuccessWithData(res), nil
}
