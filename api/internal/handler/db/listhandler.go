package db

import (
	"github.com/gin-gonic/gin"
	"github.com/zzopen/mysqldoc/src/common/response"
	"github.com/zzopen/mysqldoc/src/internal/logic/db"
	"github.com/zzopen/mysqldoc/src/internal/svc"
	"net/http"
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
