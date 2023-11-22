ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
ARG CADDY_DOCKER_PROXY_VERSION

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@v${CADDY_DOCKER_PROXY_VERSION} \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}-alpine
ARG CADDY_DOCKER_PROXY_VERSION

LABEL version.caddy=${CADDY_VERSION}
LABEL version.caddy-docker-proxy=v${CADDY_DOCKER_PROXY_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]