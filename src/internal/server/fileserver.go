package server

import (
	"github.com/zzopen/mysqldoc/src/common/utils"
	"github.com/zzopen/mysqldoc/src/internal/middleware"
	"io/fs"
	"log"
	"net/http"

	"github.com/zzopen/mysqldoc/src/internal/config"
	"github.com/zzopen/mysqldoc/src/ui"
)

// NewIFileServer 访问根路径等价于访问系统首页
func NewIFileServer(c config.ServerConfig) http.Handler {
	var srv http.Handler
	if utils.IsDev() {
		srv = http.FileServer(http.Dir(utils.GetDistDirPath()))
	} else {
		subFs, err := fs.Sub(ui.DistFs, ui.DistDirName)
		if err != nil {
			log.Fatalf("fs.Sub %s %s", "dist", err)
		}

		srv = http.FileServer(http.FS(subFs))
	}

	return middleware.NewFileAbortMiddleware(srv)
}
