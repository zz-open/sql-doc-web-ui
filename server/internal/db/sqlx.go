package db

import (
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/zzopen/sql-doc-web-ui/server/internal/config"
)

type DBConfig struct {
	Host     string
	Port     string
	Username string
	Password string
	DbName   string
	Extra    string
}

type DBConfigOption func(*DBConfig)

func NewDBConfig(opts ...DBConfigOption) *DBConfig {
	res := &DBConfig{Extra: "charset=utf8mb4&parseTime=True"}
	for _, opt := range opts {
		opt(res)
	}

	return res
}

func (c *DBConfig) String() string {
	dsnStr := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?%s",
		c.Username,
		c.Password,
		c.Host,
		c.Port,
		c.DbName,
		c.Extra,
	)

	return dsnStr
}

func WithHost(value string) DBConfigOption {
	return func(opts *DBConfig) {
		opts.Host = value
	}
}

func WithPort(value string) DBConfigOption {
	return func(opts *DBConfig) {
		opts.Port = value
	}
}

func WithUsername(value string) DBConfigOption {
	return func(opts *DBConfig) {
		opts.Username = value
	}
}

func WithPassword(value string) DBConfigOption {
	return func(opts *DBConfig) {
		opts.Password = value
	}
}

func WithDbName(value string) DBConfigOption {
	return func(opts *DBConfig) {
		opts.DbName = value
	}
}

func NewDbConfigByDbName(c config.Config, dbName string) *DBConfig {
	return NewDBConfig(
		WithHost(c.Mysql.Host),
		WithPort(c.Mysql.Port),
		WithUsername(c.Mysql.Username),
		WithPassword(c.Mysql.Password),
		WithDbName(dbName),
	)
}

func NewSqlxDb(c *DBConfig) (*sqlx.DB, error) {
	db, err := sqlx.Connect("mysql", c.String())
	if err != nil {
		log.Printf("open mysql error %v", err)
		return nil, err
	}

	db.SetMaxOpenConns(20) //设置最大连接数
	db.SetMaxIdleConns(10) //设置最大空闲连接数
	return db, nil
}
