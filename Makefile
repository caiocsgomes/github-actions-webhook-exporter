all:: build

.PHONY: build
build:
	go build -o github-actions-webhook-exporter .
