package utils

import "github.com/zz-open/sql-doc-web-ui/server/internal/config"

func IsDev() bool {
	return config.C.Env == "dev"
}

func IsProd() bool {
	return config.C.Env == "prod"
}
