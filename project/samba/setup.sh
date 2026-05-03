#!/bin/bash

apt-get install -y samba

tee /etc/samba/smb.conf << EOF
[global]
   workgroup = WORKGROUP
   server string = Vuln Samba
   map to guest = Bad User
   guest account = nobody

   # Weak / legacy protocol support
   server min protocol = NT1
   ntlm auth = yes
   lanman auth = yes

   # Disable signing
   server signing = disabled

[vulnshare]
   path = /srv/samba/vuln
   browsable = yes
   writable = yes
   guest ok = yes
   read only = no
   force user = nobody
EOF

mkdir -p /srv/samba/vuln
chmod 777 /srv/samba/vuln
systemctl enable --now smbd
