
FROM alpine:latest

ENV VERSION_HUGO=0.60.0

RUN apk add --no-cache bash curl git libc6-compat libstdc++ nodejs nodejs-npm openssl openssl-dev yarn

RUN curl -OL https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_${VERSION_HUGO}_Linux-64bit.tar.gz

ENTRYPOINT [ "bash", "-c" ]