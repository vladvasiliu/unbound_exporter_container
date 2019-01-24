This is a Docker container running an unbound exporter for Prometheus.
The actual exporter code is https://github.com/kumina/unbound_exporter
It's based on [golang:alpine](https://hub.docker.com/_/golang/) as a stage 1 image and [alpine:latest](https://hub.docker.com/_/alpine) as the clean environment.
Health check is done via curl.
