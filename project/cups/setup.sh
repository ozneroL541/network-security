#!/bin/bash

apt-get update
apt-get install -y cups
rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

tee /etc/cups/cupsd.conf << EOF
Listen 0.0.0.0:631

<Location />
  Order allow,deny
  Allow all
</Location>

<Location /admin>
  Order allow,deny
  Allow all
</Location>

WebInterface Yes
DefaultAuthType Basic
EOF

systemctl enable --now cups
