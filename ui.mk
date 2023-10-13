include common.mk

UI_DIST_PATH=$(UI_PATH)/dist

.PHONY: clean-ui

clean-ui:
	@rm -rf $(UI_DIST_PATH)
	@echo "Clean Ui finish ..."

.PHONY: dev-ui build-ui mv-ui
mv-ui:
	@cd $(UI_PATH) && \
	cp -rpf dist $(GO_UI_PATH) && \
	echo "mv-ui success ..."

dev-ui:
	@cd $(UI_PATH) && \
    pnpm run dev && \
    echo "dev-ui success ..."

build-ui:
	@cd $(UI_PATH) && \
	pnpm run build && \
	echo "build-ui success ..."