package response

import (
	"strconv"
	"time"

	"github.com/zz-open/sql-doc-web-ui/server/internal/types"
)

type ApiResponse = types.Reply

type ApiResponseOption func(*ApiResponse)

func WithData(value any) ApiResponseOption {
	return func(opts *ApiResponse) {
		opts.Data = value
	}
}

func WithMsg(value string) ApiResponseOption {
	return func(opts *ApiResponse) {
		opts.Msg = value
	}
}

func WithCode(value string) ApiResponseOption {
	return func(opts *ApiResponse) {
		opts.Code = value
	}
}

func NewApiResponse(opts ...ApiResponseOption) *ApiResponse {
	res := &ApiResponse{Time: strconv.FormatInt(time.Now().Unix(), 10)}
	for _, opt := range opts {
		opt(res)
	}

	return res
}

func Success() *ApiResponse {
	return NewApiResponse(WithCode(SuccessCode), WithMsg(SuccessMsg), WithData(nil))
}

func SuccessWithData(data any) *ApiResponse {
	return NewApiResponse(WithCode(SuccessCode), WithMsg(SuccessMsg), WithData(data))
}

func Fail() *ApiResponse {
	return NewApiResponse(WithCode(FailCode), WithMsg(FailMsg), WithData(nil))
}

func FailWithMsg(msg string) *ApiResponse {
	return NewApiResponse(WithCode(FailCode), WithMsg(msg), WithData(nil))
}
