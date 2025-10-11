all:: build

.PHONY: build
build:
	go build -o github-actions-webhook-exporter .

## Lazy helpers for local stuff
.PHONY: tag-push-patch
tag-push-patch:
	@LATEST_TAG=$$(git describe --tags --abbrev=0); \
	NEW_TAG=$$(echo $$LATEST_TAG | awk -F. -v OFS=. '{$$3++;print}'); \
	echo "Creating new tag: $$NEW_TAG"; \
	git tag $$NEW_TAG; \
	git push origin $$NEW_TAG
