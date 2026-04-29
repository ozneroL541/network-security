#!/bin/bash

apt install -y cups

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
