FROM golang:alpine as builder

RUN apk update && \
    apk add git

WORKDIR /unbound_exporter

RUN go get github.com/kumina/unbound_exporter
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app github.com/kumina/unbound_exporter


FROM alpine:latest

LABEL version="0.4"
LABEL description="Prometheus Unbound exporter"
LABEL maintainer="Vlad Vasiliu <vladvasiliun@yahoo.fr>"

EXPOSE 9167
WORKDIR /bin
COPY --from=builder /unbound_exporter/app ./unbound_exporter
HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD curl -s http://127.0.0.1:9167 || exit 1
CMD [ "./unbound_exporter" ]
