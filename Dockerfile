FROM golang:alpine

LABEL version="0.2"
LABEL description="Prometheus Unbound exporter"
LABEL maintainer="Vlad Vasiliu <vladvasiliun@yahoo.fr>"

EXPOSE 9167

RUN apk update && \
    apk add git

RUN go get github.com/kumina/unbound_exporter
RUN go install github.com/kumina/unbound_exporter

RUN apk del git

CMD /go/bin/unbound_exporter
