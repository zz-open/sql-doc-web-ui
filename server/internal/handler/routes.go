package handler

import (
	"fmt"

	"github.com/gin-gonic/gin"

	"github.com/zzopen/sql-doc-web-ui/server/internal/config"
	handlerConfig "github.com/zzopen/sql-doc-web-ui/server/internal/handler/config"
	"github.com/zzopen/sql-doc-web-ui/server/internal/handler/db"
	"github.com/zzopen/sql-doc-web-ui/server/internal/handler/table"
	"github.com/zzopen/sql-doc-web-ui/server/internal/svc"
)

func RegisterHandlers(server *gin.Engine, serverCtx *svc.ServiceContext) {
	dbRouter := server.Group(fmt.Sprintf("/%s/%s", config.ApiGroup, "db"))
	{
		dbRouter.GET("/list", db.ListHandler(serverCtx))
		dbRouter.GET("/info", db.InfoHandler(serverCtx))
	}

	tableRouter := server.Group(fmt.Sprintf("/%s/%s", config.ApiGroup, "table"))
	{
		tableRouter.GET("/info", table.InfoHandler(serverCtx))
		tableRouter.GET("/list", table.ListHandler(serverCtx))
	}

	configRouter := server.Group(fmt.Sprintf("/%s/%s", config.ApiGroup, "config"))
	{
		configRouter.GET("/info", handlerConfig.InfoHandler(serverCtx))
	}
}
