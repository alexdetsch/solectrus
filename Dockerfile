FROM ghcr.io/ledermann/rails-base-builder:3.0.3-alpine AS Builder

# Remove some files not needed in resulting image.
# Because they are required for building the image, they can't be added to .dockerignore
RUN rm -r package.json yarn.lock postcss.config.js tailwind.config.js babel.config.js config/webpack

FROM ghcr.io/ledermann/rails-base-final:3.0.3-alpine
LABEL maintainer="georg@ledermann.dev"

# Workaround to trigger Builder's ONBUILDs to finish:
COPY --from=Builder /etc/alpine-release /tmp/dummy

USER app

# Script to be executed every time the container starts
ENTRYPOINT ["docker/startup.sh"]
