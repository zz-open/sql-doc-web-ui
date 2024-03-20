package config

var C Config

type Config struct {
	Env string
	Log struct {
		FileName string
		Mode     string
		Path     string
		Level    string
	}
}

func (c Config) IsDev() bool {
	return c.Env == EnvDev
}

func (c Config) IsProd() bool {
	return c.Env == EnvProd
}

var Sc ServerConfig

type ServerConfig struct {
	Port                   string
	AutoOpenDefaultBrowser bool
	CreateSqlFile          bool
	OnlyStartApiServer     bool
	Mysql                  struct {
		Host     string
		Port     string
		Username string
		Password string
		DbName   string
	}
}
