#
# build container
#
FROM --platform=linux/amd64 golang:1.19-alpine as builder
WORKDIR /
ADD . /

ARG GOARCH

RUN go env -w GOPROXY=https://goproxy.cn

# linux x86
RUN apk add make
RUN go build -o ./grafana-agent  ./cmd/grafana-agent

RUN [ "$GOARCH" = $GOARCH ]  && /grafana-agent -version || ls -la /grafana-agent

#
# scratch release container
#
FROM --platform=linux/amd64 scratch as scratch

COPY --from=builder /grafana-agent /grafana-agent

EXPOSE     12345
ENTRYPOINT [ "/grafana-agent" ]
