FROM debian:stable-slim
LABEL maintainer="info@micheleadduci.net"

VOLUME /site

EXPOSE 1313

WORKDIR /site

ENV HUGO_VERSION 0.42.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

# Install pygments (for syntax highlighting)
RUN apt-get -qq update \
  && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates curl \
  && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} -o /tmp/hugo.deb  \
  && dpkg -i /tmp/hugo.deb \
  && rm /tmp/hugo.deb \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["hugo"]
