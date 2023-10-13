package middleware

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func NewCorsMiddleware() gin.HandlerFunc {
	c := cors.DefaultConfig()
	c.AllowOrigins = []string{"*"}
	return cors.New(c)
}
