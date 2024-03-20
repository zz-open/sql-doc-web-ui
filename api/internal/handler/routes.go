package handler

import (
	"github.com/gin-gonic/gin"

	"github.com/zzopen/mysqldoc/src/internal/handler/config"
	"github.com/zzopen/mysqldoc/src/internal/handler/db"
	"github.com/zzopen/mysqldoc/src/internal/handler/table"
	"github.com/zzopen/mysqldoc/src/internal/svc"
)

func RegisterHandlers(server *gin.Engine, serverCtx *svc.ServiceContext) {
	dbRouter := server.Group("/api/db")
	{
		dbRouter.GET("/list", db.ListHandler(serverCtx))
		dbRouter.GET("/info", db.InfoHandler(serverCtx))
	}

	tableRouter := server.Group("/api/table")
	{
		tableRouter.GET("/info", table.InfoHandler(serverCtx))
		tableRouter.GET("/list", table.ListHandler(serverCtx))
	}

	configRouter := server.Group("/api/config")
	{
		configRouter.GET("/info", config.InfoHandler(serverCtx))
	}
}
