package table

import (
	"github.com/zzopen/mysqldoc/src/common/response"
	"net/http"

	"github.com/gin-gonic/gin"

	"github.com/zzopen/mysqldoc/src/internal/logic/table"
	"github.com/zzopen/mysqldoc/src/internal/svc"
	"github.com/zzopen/mysqldoc/src/internal/types"
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
