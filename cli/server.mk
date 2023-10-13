include ./common.mk

.PHONY: clean-server
clean-server:
	@rm -rf $(OUT_PATH)
	@echo "Clean Server finish ..."

.PHONY: dev-api dev-all
#### dev ####
dev-server-api:
	@cd $(SRC_PATH) && \
	go run mysqldoc.go start -f etc/config-dev.yaml --env dev --onlyStartApiServer

dev-server:
	@cd $(SRC_PATH) && \
	go run mysqldoc.go start -f etc/config-dev.yaml --env dev

.PHONY: build-server build-server-win build-server-linux build-server-darwin
#### build server for various platform####
build-server:
	@cd $(SRC_PATH) && $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(BUILD_UPX) && \
	echo "Build server success ..."

build-server-win:
	@$(BUILD_PARAMS) GOOS=windows
	@cd $(SRC_PATH) && $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(WINDOWS_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(WINDOWS_UPX) && \
	echo "Build server windows success ..."

build-server-linux:
	@$(BUILD_PARAMS) GOOS=linux
	@cd $(SRC_PATH) && $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(LINUX_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(LINUX_UPX) && \
	echo "Build server linux success ..."

build-server-darwin:
	@$(BUILD_PARAMS) GOOS=darwin
	@cd $(SRC_PATH) && $(GO_BUILD) -ldflags="-s -w" -o $(OUT_PATH)/$(DARWIN_BIN_NAME) ./$(MAIN_GO_FILE_NAME) && \
	$(DARWIN_UPX) && \
	echo "Build server darwin success ..."