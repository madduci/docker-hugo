FROM alpine:3.24.2@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

LABEL maintainer="Michele Adduci <michele@adduci.org>"

VOLUME ["/site"]

WORKDIR /site

EXPOSE 1313

ENV HUGO_VERSION=0.164.0

RUN apk update \
    && apk --update add \
      curl \
      ca-certificates \
      py-pygments \
      tzdata \
    && curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz" > /tmp/hugo.tar.gz \
    && mkdir /usr/local/hugo \
    && tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
    && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
    && apk del curl \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/hugo"]
