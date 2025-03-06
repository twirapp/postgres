ARG postgresql_major=17
ARG postgresql_release=${postgresql_major}.4
ARG pgx_ulid_release=0.2.0

FROM postgres:${postgresql_release} as base
ARG postgresql_major

FROM base as pgx_ulid
ARG pgx_ulid_release
ADD "https://github.com/pksunkara/pgx_ulid/releases/download/v${pgx_ulid_release}/pgx_ulid-v${pgx_ulid_release}-pg${postgresql_major}-amd64-linux-gnu.deb" \
    /tmp/pgx_ulid.deb

FROM scratch as extensions
COPY --from=pgx_ulid /tmp/*.deb /tmp/

####################
# Build final image
####################
FROM base as production

# Setup extensions
COPY --from=extensions /tmp /tmp

RUN apt-get update && apt-get install -y --no-install-recommends \
 /tmp/*.deb \
 && rm -rf /var/lib/apt/lists/* /tmp/*