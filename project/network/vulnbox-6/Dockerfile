FROM mysql:5.7

ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

RUN yum clean all && \
    yum install -y iproute iputils nmap curl net-tools && \
    yum clean all && \
    rm -rf /var/cache/yum
