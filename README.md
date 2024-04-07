# docker-hugo

[![Build and Publish](https://github.com/madduci/docker-hugo/actions/workflows/build.yml/badge.svg)](https://github.com/madduci/docker-hugo/actions/workflows/build.yml)

Hugo Docker container, powered by Alpine Linux and Hugo latest release available at [GitHub repository](https://github.com/gohugoio/hugo/releases).

To run this image (and to build your pages), you can simply run:

`docker run --rm -it -p 1313:1313 -v /host/mysite:/site madduci/docker-hugo server --bind "0.0.0.0"`

Beware as entrypoint the application *hugo* is exposed

### Warning

By default, Hugo will run on 127.0.0.1 (default configuration): this will make Hugo unreachable from outside the docker container.

To override this behaviour, just give the extra `--bind "X.X.X.X"` parameter to serve the specific IP.
