#
# build container
#
FROM --platform=linux/amd64 golang:1.19-alpine as builder
WORKDIR /
ADD . /

ARG GOARCH

RUN go env -w GOPROXY=https://goproxy.cn

# linux x86
RUN BUILD_DATE=$(date +%F-%T) CGO_ENABLED=0 GOOS=linux GOARCH=$GOARCH go build -o /grafana-agent \
    -ldflags  "-s -w -extldflags \"-static\"  -X main.BuildDate=$BUILD_DATE" ./cmd/grafana-agent

RUN [ "$GOARCH" = $GOARCH ]  && /grafana-agent -version || ls -la /grafana-agent

#
# scratch release container
#
FROM --platform=linux/amd64 scratch as scratch

COPY --from=builder /grafana-agent /grafana-agent

EXPOSE     12345
ENTRYPOINT [ "/grafana-agent" ]
