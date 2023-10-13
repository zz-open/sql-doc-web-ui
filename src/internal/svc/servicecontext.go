package svc

import (
	"context"
	"github.com/jmoiron/sqlx"
	"github.com/zzopen/mysqldoc/src/internal/config"
	"github.com/zzopen/mysqldoc/src/internal/db"
	"log"
)

type ServiceContext struct {
	Config config.ServerConfig
	Ctx    context.Context
	SqlxDb *sqlx.DB
}

func NewServiceContext(c config.ServerConfig) *ServiceContext {
	ctx := context.Background()

	sqlxDb, err := db.NewSqlxDb(db.NewDbConfigByDbName(c, c.Mysql.DbName))
	if err != nil {
		log.Fatalln(err)
	}

	return &ServiceContext{
		Ctx:    ctx,
		Config: c,
		SqlxDb: sqlxDb,
	}
}
