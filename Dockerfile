FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL maintainer="Michele Adduci <michele@adduci.org>"

VOLUME ["/site"]

WORKDIR /site

EXPOSE 1313

ENV HUGO_VERSION=0.162.1

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
