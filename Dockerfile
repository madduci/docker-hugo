FROM alpine:latest

LABEL maintainer="Michele Adduci <adduci@tutanota.com>"

VOLUME ["/site"]

WORKDIR /site

EXPOSE 1313

ENV HUGO_VERSION 0.104.0

RUN apk update \
    && apk --update add \
      curl \
      ca-certificates \
      py-pygments \
    && curl -L "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz" > /tmp/hugo.tar.gz \
    && mkdir /usr/local/hugo \
    && tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
    && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
    && apk del curl \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/hugo"]
