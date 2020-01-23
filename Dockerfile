ARG CODE_VERSION=0.11
FROM phusion/baseimage:${CODE_VERSION}
LABEL maintainer="ts@strategic.zone"
LABEL version="0.0.1-beta"
LABEL release-date="2019-10-28"


COPY subspace-linux-amd64 /usr/bin/subspace
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV DEBIAN_FRONTEND noninteractive

RUN chmod +x /usr/bin/subspace /usr/local/bin/entrypoint.sh

RUN apt-get update \
    && apt-get install -y iproute2 iptables dnsmasq socat \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD [ "/sbin/my_init" ]
