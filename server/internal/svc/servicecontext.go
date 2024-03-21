package svc

import (
	"context"
	"log"

	"github.com/jmoiron/sqlx"
	"github.com/zzopen/sql-doc-web-ui/server/internal/config"
	"github.com/zzopen/sql-doc-web-ui/server/internal/db"
)

type ServiceContext struct {
	Config config.Config // 配置项
	Ctx    context.Context
	SqlxDb *sqlx.DB
}

func NewServiceContext(c config.Config) *ServiceContext {
	ctx := context.Background()

	sqlxDb, err := db.NewSqlxDb(db.NewDbConfigByDbName(c, c.Mysql.DatabaseName))
	if err != nil {
		log.Fatalln(err)
	}

	return &ServiceContext{
		Ctx:    ctx,
		Config: c,
		SqlxDb: sqlxDb,
	}
}
