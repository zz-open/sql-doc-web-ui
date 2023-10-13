package server

import (
	"context"
	"errors"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"

	"github.com/gookit/color"

	"github.com/zzopen/mysqldoc/src/common/utils"
	"github.com/zzopen/mysqldoc/src/internal/config"
)

var server *http.Server

func StartServer(c config.ServerConfig) {
	apiServer := NewApiServer(c)

	var fileServer http.Handler
	if !c.OnlyStartApiServer {
		fileServer = NewIFileServer(c)
	}

	addr := config.DefaultHost + ":" + c.Port
	server := &http.Server{
		Addr: addr,
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if c.OnlyStartApiServer {
				apiServer.ServeHTTP(w, r)
				return
			}

			if strings.HasPrefix(r.URL.Path, "/api") {
				apiServer.ServeHTTP(w, r)
				return
			}

			if fileServer != nil {
				fileServer.ServeHTTP(w, r)
			}

			return
		}),
	}

	go func() {
		log.Printf(color.Green.Sprintf("Starting server at %s...\n", server.Addr))
		if err := server.ListenAndServe(); err != nil && !errors.Is(err, http.ErrServerClosed) {
			log.Fatalf(color.Red.Sprintf("服务启动失败: %s\n", err))
		}
	}()

	if c.AutoOpenDefaultBrowser {
		_ = utils.OpenWithBrowser("http://localhost:" + c.Port)
	}

	stopServer()
}

func stopServer() {
	quit := make(chan os.Signal)
	// kill (no param) default send syscall.SIGTERM
	// kill -2 is syscall.SIGINT
	// kill -9 is syscall.SIGKILL but can't be caught, so don't need to add it
	signal.Notify(quit, os.Kill, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println(color.Yellow.Sprintf("Shutting down server..."))

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if server != nil {
		if err := server.Shutdown(ctx); err != nil {
			log.Fatal(color.Yellow.Sprintf("Server forced to shutdown:", err))
		}
	}

	log.Println(color.Yellow.Sprintf("Server exiting"))
}
