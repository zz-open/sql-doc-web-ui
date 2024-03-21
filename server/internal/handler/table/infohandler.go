package table

import (
	"net/http"

	"github.com/zz-open/sql-doc-web-ui/server/common/response"

	"github.com/gin-gonic/gin"

	"github.com/zz-open/sql-doc-web-ui/server/internal/logic/table"
	"github.com/zz-open/sql-doc-web-ui/server/internal/svc"
)

func InfoHandler(svcCtx *svc.ServiceContext) gin.HandlerFunc {
	return func(c *gin.Context) {
		l := table.NewInfoLogic(c.Request.Context(), svcCtx)
		resp, err := l.Info()
		if err != nil {
			c.JSON(http.StatusOK, response.FailWithMsg(err.Error()))
		} else {
			c.JSON(http.StatusOK, resp)
		}
	}
}
