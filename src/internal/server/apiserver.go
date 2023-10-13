package server

import (
	"github.com/gin-gonic/gin"
	"github.com/zzopen/mysqldoc/src/common/logx"
	"github.com/zzopen/mysqldoc/src/common/utils"
	"github.com/zzopen/mysqldoc/src/internal/config"
	"github.com/zzopen/mysqldoc/src/internal/handler"
	"github.com/zzopen/mysqldoc/src/internal/middleware"
	"github.com/zzopen/mysqldoc/src/internal/svc"
)

func NewApiServer(c config.ServerConfig) *gin.Engine {
	if utils.IsDev() {
		gin.SetMode(gin.DebugMode)
	} else if utils.IsProd() {
		gin.SetMode(gin.ReleaseMode)
	}

	engine := gin.New()
	engine.Use(
		//gin.Logger(),
		//gin.Recovery(),
		middleware.NewRecoveryMiddleware(*logx.Logger, true),
		middleware.NewLogMiddleware(*logx.Logger),
		middleware.NewCorsMiddleware(),
	)

	sc := svc.NewServiceContext(c)
	handler.RegisterHandlers(engine, sc)
	return engine
}
