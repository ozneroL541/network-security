# Vulnbox 1 - Ubuntu 22.04
# Pivot node for networking

FROM ubuntu:22.04

RUN apt-get update -qq && \
    apt-get install -y -qq iproute2 iputils-ping nmap curl net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo '[HUB] Ready - acting as central pivot node'

COPY entrypoint.sh /entrypoint.sh

CMD ["tail", "-f", "/dev/null"]

ENTRYPOINT ["/entrypoint.sh"]
