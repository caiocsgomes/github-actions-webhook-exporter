FROM --platform=$BUILDPLATFORM golang:1.25-alpine AS builder
ARG TARGETOS TARGETARCH
WORKDIR /src
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /out/github-actions-webhook-exporter /src


## This stage will pick the image from the target platform
FROM cgr.dev/chainguard/static:latest
COPY --from=builder /out/github-actions-webhook-exporter /github-actions-webhook-exporter
USER nobody
ENTRYPOINT ["/github-actions-webhook-exporter"]
EXPOSE     9101
