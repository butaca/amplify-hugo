FROM debian:stable-slim

ENV VERSION_HUGO=0.62.2

RUN apt-get update && apt-get install -y curl git openssl nodejs

RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz

ENTRYPOINT [ "bash", "-c" ]