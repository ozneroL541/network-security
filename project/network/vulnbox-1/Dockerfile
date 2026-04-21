# Vulnbox 1 - Ubuntu 22.04
# Pivot node for networking

FROM ubuntu:22.04

RUN apt-get update -qq && \
    apt-get install -y -qq iproute2 iputils-ping nmap curl net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["tail", "-f", "/dev/null"]
