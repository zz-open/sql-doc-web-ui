package server

import (
	"github.com/gin-gonic/gin"
	"github.com/zz-open/sql-doc-web-ui/server/common/utils"
	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
	"github.com/zz-open/sql-doc-web-ui/server/internal/handler"
	"github.com/zz-open/sql-doc-web-ui/server/internal/middleware"
	"github.com/zz-open/sql-doc-web-ui/server/internal/svc"
)

func NewApiServer(c config.Config) *gin.Engine {
	if utils.IsDev() {
		gin.SetMode(gin.DebugMode)
	} else if utils.IsProd() {
		gin.SetMode(gin.ReleaseMode)
	}

	engine := gin.New()
	engine.Use(
		gin.Recovery(),
		middleware.NewCorsMiddleware(),
	)

	if utils.IsDev() {
		engine.Use(gin.Logger())
	}

	sc := svc.NewServiceContext(c)
	handler.RegisterHandlers(engine, sc)
	return engine
}
