package db

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/zzopen/sql-doc-web-ui/server/common/response"
	"github.com/zzopen/sql-doc-web-ui/server/internal/logic/db"
	"github.com/zzopen/sql-doc-web-ui/server/internal/svc"
)

func ListHandler(svcCtx *svc.ServiceContext) gin.HandlerFunc {
	return func(c *gin.Context) {
		l := db.NewListLogic(c.Request.Context(), svcCtx)
		resp, err := l.List()
		if err != nil {
			c.JSON(http.StatusOK, response.FailWithMsg(err.Error()))
		} else {
			c.JSON(http.StatusOK, resp)
		}
	}
}
