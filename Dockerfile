FROM alpine:3.20

LABEL maintainer="Ivan Belousov <hello@ivanbelousov.com>"

# Install curl and bash
RUN apk add --no-cache curl bash

# Set entrypoint to clogin
ENTRYPOINT [ "clogin" ]

# Add binaries
COPY bin /bin
