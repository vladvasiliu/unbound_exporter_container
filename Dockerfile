FROM golang:alpine as builder

RUN apk update && \
    apk add git

WORKDIR /unbound_exporter

RUN go get github.com/kumina/unbound_exporter
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app github.com/kumina/unbound_exporter


FROM alpine:latest

LABEL version="0.3"
LABEL description="Prometheus Unbound exporter"
LABEL maintainer="Vlad Vasiliu <vladvasiliun@yahoo.fr>"

EXPOSE 9167
WORKDIR /bin
COPY --from=builder /unbound_exporter/app .
CMD [ "./app" ]
