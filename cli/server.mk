BIN_NAME=sdwu
MAIN_GO_FILE_NAME=main.go

# platform
DARWIN_BIN_NAME=$(BIN_NAME)-darwin
WINDOWS_BIN_NAME=$(BIN_NAME).exe
LINUX_BIN_NAME=$(BIN_NAME)-linux

BUILD_BIN_PATH=$(OUT_PATH)/$(BIN_NAME)
DARWIN_BIN_PATH=$(OUT_PATH)/$(DARWIN_BIN_NAME)
WINDOWS_BIN_PATH=$(OUT_PATH)/$(WINDOWS_BIN_NAME)
LINUX_BIN_PATH=$(OUT_PATH)/$(LINUX_BIN_NAME)

BUILD_PARAMS=CGO_ENABLED=0 GOARCH=amd64

# upx
IF_UPX= $(shell command -v upx)
BUILD_UPX=$(if $(IF_UPX), upx $(BUILD_BIN_PATH))
DARWIN_UPX=$(if $(IF_UPX), upx $(DARWIN_BIN_PATH))
WINDOWS_UPX=$(if $(IF_UPX), upx $(WINDOWS_BIN_PATH))
LINUX_UPX=$(if $(IF_UPX), upx $(LINUX_BIN_PATH))

.PHONY: clean-server
clean-server:
	@rm -rf $(OUT_PATH)
	@echo "Clean Server finish ..."

.PHONY: dev-server
#### dev ####
dev-server:
	cd $(SRC_PATH) && \
	go run $(MAIN_GO_FILE_NAME) start -f config-dev.yaml

.PHONY: build-server build-server-win build-server-linux build-server-darwin
#### build server for various platform ####
build-server:
	@cd $(SRC_PATH) && $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(BUILD_UPX) && \
	echo "Build server success ..."

build-server-win:
	@cd $(SRC_PATH) && $(BUILD_PARAMS) GOOS=windows $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(WINDOWS_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(WINDOWS_UPX) && \
	echo "Build server windows success ..."

build-server-linux:
	@cd $(SRC_PATH) && $(BUILD_PARAMS) GOOS=linux $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(LINUX_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(LINUX_UPX) && \
	echo "Build server linux success ..."

build-server-darwin:
	@cd $(SRC_PATH) && $(BUILD_PARAMS) GOOS=darwin $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(DARWIN_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(DARWIN_UPX) && \
	echo "Build server darwin success ..."