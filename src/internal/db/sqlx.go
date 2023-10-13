package db

import (
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/zzopen/mysqldoc/src/internal/config"
)

type Config struct {
	Host     string
	Port     string
	Username string
	Password string
	DbName   string
	Extra    string
}

type ConfigOption func(*Config)

func NewConfig(opts ...ConfigOption) *Config {
	res := &Config{Extra: "charset=utf8mb4&parseTime=True"}
	for _, opt := range opts {
		opt(res)
	}

	return res
}

func (c *Config) String() string {
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

func WithHost(value string) ConfigOption {
	return func(opts *Config) {
		opts.Host = value
	}
}

func WithPort(value string) ConfigOption {
	return func(opts *Config) {
		opts.Port = value
	}
}

func WithUsername(value string) ConfigOption {
	return func(opts *Config) {
		opts.Username = value
	}
}

func WithPassword(value string) ConfigOption {
	return func(opts *Config) {
		opts.Password = value
	}
}

func WithDbName(value string) ConfigOption {
	return func(opts *Config) {
		opts.DbName = value
	}
}

func NewDbConfigByDbName(c config.ServerConfig, dbName string) *Config {
	return NewConfig(
		WithHost(c.Mysql.Host),
		WithPort(c.Mysql.Port),
		WithUsername(c.Mysql.Username),
		WithPassword(c.Mysql.Password),
		WithDbName(dbName),
	)
}

func NewSqlxDb(c *Config) (*sqlx.DB, error) {
	db, err := sqlx.Connect("mysql", c.String())
	if err != nil {
		log.Printf("open mysql error %v", err)
		return nil, err
	}

	db.SetMaxOpenConns(20) //设置最大连接数
	db.SetMaxIdleConns(10) //设置最大空闲连接数
	return db, nil
}
