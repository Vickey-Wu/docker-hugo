FROM alpine:latest

MAINTAINER JG <julien@mangue.eu>

RUN apk add --no-cache \
    curl \
    openssh-client \
    rsync

ENV VERSION 0.16
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \

    && curl -L https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tgz | tar -xz \
    && mv hugo /usr/local/bin/hugo \

    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/local/bin/ \

    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313
