package db

import (
	"net/http"

	"github.com/zzopen/sql-doc-web-ui/server/common/response"
	"github.com/zzopen/sql-doc-web-ui/server/internal/logic/db"
	"github.com/zzopen/sql-doc-web-ui/server/internal/types"

	"github.com/gin-gonic/gin"

	"github.com/zzopen/sql-doc-web-ui/server/internal/svc"
)

func InfoHandler(svcCtx *svc.ServiceContext) gin.HandlerFunc {
	return func(c *gin.Context) {
		l := db.NewInfoLogic(c.Request.Context(), svcCtx)
		req := &types.DbInfoRequest{DbName: c.DefaultQuery("db_name", "")}
		resp, err := l.Info(req)
		if err != nil {
			c.JSON(http.StatusOK, response.FailWithMsg(err.Error()))
		} else {
			c.JSON(http.StatusOK, resp)
		}
	}
}
