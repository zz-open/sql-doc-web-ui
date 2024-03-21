package server

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"

	"github.com/gookit/color"
	"github.com/zz-open/sql-doc-web-ui/server/common/utils"
	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
)

var server *http.Server

func StartServer(c config.Config) {
	staticServer := NewStaticServer(c)
	addr := fmt.Sprintf("%s:%s", c.Host, c.Port)
	apiServer := NewApiServer(c)
	server := &http.Server{
		Addr: addr,
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if strings.HasPrefix(r.URL.Path, "/"+config.StaticGroup) {
				staticServer.ServeHTTP(w, r)
				return
			}

			if strings.HasPrefix(r.URL.Path, "/"+config.ApiGroup) {
				apiServer.ServeHTTP(w, r)
				return
			}
		}),
	}

	go func() {
		log.Println(color.Green.Sprintf("Starting server at %s...\n", server.Addr))
		if err := server.ListenAndServe(); err != nil && !errors.Is(err, http.ErrServerClosed) {
			log.Fatalf(color.Red.Sprintf("服务启动失败: %s\n", err))
		}
	}()

	if c.OpenBrowser {
		_ = utils.OpenLocalBrowser(fmt.Sprintf("%s://%s:%s%s", "http", "localhost", config.C.Port, "/ui/"))
	}

	listenStopServer()
}

func listenStopServer() {
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println(color.Yellow.Sprintf("Shutting down server..."))

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if server != nil {
		if err := server.Shutdown(ctx); err != nil {
			log.Fatal(color.Yellow.Sprintf("Server forced to shutdown: %+v", err))
		}
	}

	log.Println(color.Yellow.Sprintf("Server exiting"))
}
