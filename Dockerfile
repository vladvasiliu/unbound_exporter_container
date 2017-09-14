FROM golang:alpine

LABEL com.lcgp.vendor="Les Cinemas Gaumont Pathe"
LABEL version="0.1"
LABEL description="Prometheus Unbound exporter"
LABEL maintainer="Vlad Vasiliu <v.vasiliu@cinemasgaumontpathe.com>"

EXPOSE 9167

RUN apk update && \
    apk add git

RUN go-wrapper download github.com/kumina/unbound_exporter
RUN go-wrapper install github.com/kumina/unbound_exporter

RUN apk del git

CMD /go/bin/unbound_exporter
