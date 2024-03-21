package server

import (
	"io/fs"
	"log"
	"net/http"

	"github.com/zz-open/sql-doc-web-ui/server/internal/middleware"

	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
	"github.com/zz-open/sql-doc-web-ui/server/ui"
)

func NewStaticServer(c config.Config) http.Handler {
	subFs, err := fs.Sub(ui.DistFs, config.DistDirName)
	if err != nil {
		log.Fatalf("fs.Sub %s %s", config.DistDirName, err)
	}

	return middleware.NewFileAbortMiddleware(http.StripPrefix("/ui/", http.FileServer(http.FS(subFs))))
}
