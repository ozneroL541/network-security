#!/bin/bash

#apt-get update
#apt-get install -y rsyslog
#apt-get clean
#rm -rf /var/lib/apt/lists/*

# Enable UDP + TCP syslog reception
cat << EOF > /etc/rsyslog.d/10-remote.conf
# Load modules
module(load="imudp")
input(type="imudp" port="514")

module(load="imtcp")
input(type="imtcp" port="514")

# Log EVERYTHING from remote hosts
*.* /var/log/remote.log

# No rate limiting (intentionally bad)
\$SystemLogRateLimitInterval 0
EOF

# Ensure rsyslog is enabled
systemctl enable rsyslog
systemctl restart rsyslog

mkdir -p /var/log/
chmod 777 -R /var/log/
