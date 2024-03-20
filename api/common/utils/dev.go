package utils

import "github.com/zzopen/mysqldoc/src/internal/config"

func IsDev() bool {
	return config.C.IsDev()
}

func IsProd() bool {
	return config.C.IsDev()
}
