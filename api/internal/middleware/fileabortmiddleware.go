package middleware

import (
	"github.com/zzopen/mysqldoc/src/ui"
	"net/http"
	"strings"
)

func NewFileAbortMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// 防止列出目录下文件
		suffixCond := strings.HasSuffix(r.URL.Path, "/") && r.URL.Path != "/"
		// 不能直接访问前端资源目录
		assetsCond := r.URL.Path == ui.AssetsPrefix
		if suffixCond || assetsCond {
			http.Redirect(w, r, "/abort.html", http.StatusPermanentRedirect)
			return
		}

		next.ServeHTTP(w, r)
	})
}
