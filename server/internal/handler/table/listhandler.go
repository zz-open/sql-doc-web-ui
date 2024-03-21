package table

import (
	"net/http"

	"github.com/zz-open/sql-doc-web-ui/server/common/response"

	"github.com/gin-gonic/gin"

	"github.com/zz-open/sql-doc-web-ui/server/internal/logic/table"
	"github.com/zz-open/sql-doc-web-ui/server/internal/svc"
	"github.com/zz-open/sql-doc-web-ui/server/internal/types"
)

func ListHandler(svcCtx *svc.ServiceContext) gin.HandlerFunc {
	return func(c *gin.Context) {
		l := table.NewListLogic(c.Request.Context(), svcCtx)
		req := &types.TableListRequest{DbName: c.DefaultQuery("db_name", "")}
		resp, err := l.List(req)
		if err != nil {
			c.JSON(http.StatusOK, response.FailWithMsg(err.Error()))
		} else {
			c.JSON(http.StatusOK, resp)
		}
	}
}
