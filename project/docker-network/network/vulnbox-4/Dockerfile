# Vulnbox 4 - SSH Service with Weak Credentials
# This container runs an SSH server with weak credentials for testing purposes.
FROM ubuntu:22.04

RUN apt-get update -qq && \
    apt-get install -y -qq openssh-server iproute2 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -s /bin/bash admin; \
    echo 'admin:admin123' | chpasswd; \
    useradd -m -s /bin/bash user; \
    echo 'user:password' | chpasswd; \
    mkdir -p /run/sshd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo 'root:toor' | chpasswd

EXPOSE 22


CMD ["/usr/sbin/sshd", "-D"]
