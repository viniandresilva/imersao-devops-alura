FROM ubuntu:latest
LABEL authors="viniandre"

ENTRYPOINT ["top", "-b"]