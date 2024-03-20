package utils

import (
	"fmt"
	"github.com/zzopen/mysqldoc/src/internal/config"
	"os"
)

func GetPwdPath() string {
	rootPath, _ := os.Getwd()
	return rootPath
}

func GetDistDirPath() string {
	return GetPwdPath() + "/ui/dist"
}

func GetDefaultServerConfigFilePath() string {
	return fmt.Sprintf("%s/%s.%s", GetPwdPath(), config.DefaultSeverConfFileName, config.DefaultServerConfFileExt)
}
