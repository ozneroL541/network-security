FROM alpine:3.20

RUN apk add --no-cache \
    iproute2 \
    iputils \
    netcat-openbsd \
    openssh \
    busybox-extras \
    curl \
    shadow \
    && mkdir -p /run/sshd /srv/www

# Intentionally weak auth settings for lab-only vulnerable targets.
RUN sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?ChallengeResponseAuthentication .*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config \
    && echo 'UsePAM no' >> /etc/ssh/sshd_config \
    && adduser -D -s /bin/sh vulnuser \
    && echo 'vulnuser:vulnpass' | chpasswd \
    && echo 'root:toor' | chpasswd

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22 80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
