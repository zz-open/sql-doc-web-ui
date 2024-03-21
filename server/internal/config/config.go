package config

var C Config

type Config struct {
	Env             string      `yaml:"Env"`
	Host            string      `yaml:"Host"`
	Port            string      `yaml:"Port"`
	OpenBrowser     bool        `yaml:"OpenBrowser"`
	GenerateSqlFile bool        `yaml:"GenerateSqlFile"`
	Mysql           MysqlConfig `yaml:"Mysql"`
}

type MysqlConfig struct {
	Host         string `yaml:"Host"`
	Port         string `yaml:"Port"`
	Username     string `yaml:"Username"`
	Password     string `yaml:"Password"`
	DatabaseName string `yaml:"DatabaseName"`
}
