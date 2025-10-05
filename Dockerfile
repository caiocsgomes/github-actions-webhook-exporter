FROM cgr.dev/chainguard/static:latest

COPY github-actions-webhook-exporter /github-actions-webhook-exporter

USER nobody
ENTRYPOINT ["/github-actions-webhook-exporter"]
EXPOSE     9101
