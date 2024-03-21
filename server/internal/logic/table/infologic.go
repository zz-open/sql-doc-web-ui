package table

import (
	"context"

	"github.com/zz-open/sql-doc-web-ui/server/common/response"
	"github.com/zz-open/sql-doc-web-ui/server/internal/svc"
)

type InfoLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewInfoLogic(ctx context.Context, svcCtx *svc.ServiceContext) *InfoLogic {
	return &InfoLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

// Info /api/table/info 获取表信息
func (l *InfoLogic) Info() (resp *response.ApiResponse, err error) {
	return nil, nil
}
