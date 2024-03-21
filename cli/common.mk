# command
GO=go
GO_CMD=GO111MODULE=on
GO_VET=$(GO) vet
GO_BUILD=$(GO) build
GO_IMPORTS=goimports
GO_FMT=gofmt
GO_CTL=goctl

# path
MAKEFILE_PATH=$(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR=$(abspath $(dir $(MAKEFILE_PATH)))
CURRENT_PATH=$(MAKEFILE_DIR)
ROOT_PATH=$(abspath $(CURRENT_PATH)/../)
PROJECT_ROOT_PATH=$(ROOT_PATH)
# 服务端根目录绝对路径
SRC_PATH=$(PROJECT_ROOT_PATH)/server
# 服务端存放前端文件根目录绝对路径
GO_UI_PATH=$(SRC_PATH)/ui
# 前端根目录绝对路径
UI_PATH=$(PROJECT_ROOT_PATH)/app
# 服务端打包输出路径
OUT_PATH=$(PROJECT_ROOT_PATH)/build
