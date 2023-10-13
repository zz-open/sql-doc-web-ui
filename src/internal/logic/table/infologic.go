package table

import (
	"context"
	"github.com/zzopen/mysqldoc/src/common/response"
	"github.com/zzopen/mysqldoc/src/internal/svc"
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
