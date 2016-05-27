# Pull base image
FROM alpine:latest
MAINTAINER Ryan Gooler <ryan.gooler@gmail.com>

# Setup tini for init subsystem
RUN apk add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ tini && \
    apk add bash && \
    rm -rf /var/cache/apk/* && \
    sed -ri 's;^(root:x:0:0:root:/root:)/bin/ash;\1/bin/bash;' /etc/passwd

ENTRYPOINT ["/sbin/tini", "--"]

# Customize environment
COPY . ./

WORKDIR /root

# Define default command
CMD ["bash"]
