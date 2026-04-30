# Ports

## Debian
Starting Nmap 7.99 ( https://nmap.org ) at 2026-04-30 18:13 +0200
Initiating ARP Ping Scan at 18:13
Scanning 192.168.56.101 [1 port]
Completed ARP Ping Scan at 18:13, 0.03s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 18:13
Completed Parallel DNS resolution of 1 host. at 18:13, 0.50s elapsed
Initiating SYN Stealth Scan at 18:13
Scanning 192.168.56.101 [65535 ports]
Discovered open port 443/tcp on 192.168.56.101
Discovered open port 445/tcp on 192.168.56.101
Discovered open port 80/tcp on 192.168.56.101
Discovered open port 21/tcp on 192.168.56.101
Discovered open port 139/tcp on 192.168.56.101
Discovered open port 22/tcp on 192.168.56.101
Discovered open port 631/tcp on 192.168.56.101

## Windows XP
Starting Nmap 7.99 ( https://nmap.org ) at 2026-04-30 18:13 +0200
Initiating ARP Ping Scan at 18:13
Scanning 192.168.56.102 [1 port]
Completed ARP Ping Scan at 18:13, 0.03s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 18:13
Completed Parallel DNS resolution of 1 host. at 18:13, 0.50s elapsed
Initiating SYN Stealth Scan at 18:13
Scanning 192.168.56.102 [65535 ports]
Discovered open port 139/tcp on 192.168.56.102
Discovered open port 135/tcp on 192.168.56.102
Discovered open port 80/tcp on 192.168.56.102
Discovered open port 1025/tcp on 192.168.56.102
Discovered open port 25/tcp on 192.168.56.102
Discovered open port 443/tcp on 192.168.56.102
Discovered open port 445/tcp on 192.168.56.102
Discovered open port 7/tcp on 192.168.56.102
Discovered open port 17/tcp on 192.168.56.102
Discovered open port 19/tcp on 192.168.56.102
Discovered open port 1027/tcp on 192.168.56.102
Discovered open port 1801/tcp on 192.168.56.102
Discovered open port 2105/tcp on 192.168.56.102
Discovered open port 5000/tcp on 192.168.56.102
Discovered open port 2103/tcp on 192.168.56.102
Discovered open port 9/tcp on 192.168.56.102
Discovered open port 2107/tcp on 192.168.56.102
Discovered open port 1026/tcp on 192.168.56.102
Discovered open port 1032/tcp on 192.168.56.102
Discovered open port 13/tcp on 192.168.56.102
Completed SYN Stealth Scan at 18:13, 0.56s elapsed (65535 total ports)
Initiating UDP Scan at 18:13
Scanning 192.168.56.102 [65535 ports]
Discovered open port 137/udp on 192.168.56.102
Discovered open port 1028/udp on 192.168.56.102
Discovered open port 135/udp on 192.168.56.102
Discovered open port 17/udp on 192.168.56.102
Discovered open port 7/udp on 192.168.56.102
Discovered open port 19/udp on 192.168.56.102
Discovered open port 1030/udp on 192.168.56.102
Discovered open port 161/udp on 192.168.56.102
Discovered open port 123/udp on 192.168.56.102
Discovered open port 13/udp on 192.168.56.102
Completed UDP Scan at 18:13, 3.09s elapsed (65535 total ports)
Nmap scan report for 192.168.56.102
Host is up (0.00033s latency).
Not shown: 65516 closed udp ports (port-unreach), 65515 closed tcp ports (reset)
PORT     STATE         SERVICE
7/tcp    open          echo
9/tcp    open          discard
13/tcp   open          daytime
17/tcp   open          qotd
19/tcp   open          chargen
25/tcp   open          smtp
80/tcp   open          http
135/tcp  open          msrpc
139/tcp  open          netbios-ssn
443/tcp  open          https
445/tcp  open          microsoft-ds
1025/tcp open          NFS-or-IIS
1026/tcp open          LSA-or-nterm
1027/tcp open          IIS
1032/tcp open          iad3
1801/tcp open          msmq
2103/tcp open          zephyr-clt
2105/tcp open          eklogin
2107/tcp open          msmq-mgmt
5000/tcp open          upnp
7/udp    open          echo
9/udp    open|filtered discard
13/udp   open          daytime
17/udp   open          qotd
19/udp   open          chargen
123/udp  open          ntp
135/udp  open          msrpc
137/udp  open          netbios-ns
138/udp  open|filtered netbios-dgm
161/udp  open          snmp
445/udp  open|filtered microsoft-ds
500/udp  open|filtered isakmp
520/udp  open|filtered route
1028/udp open          ms-lsa
1030/udp open          iad1
1031/udp open|filtered iad2
1900/udp open|filtered upnp
3456/udp open|filtered IISrpc-or-vat
3527/udp open|filtered beserver-msg-q
MAC Address: 08:00:27:20:21:15 (Oracle VirtualBox virtual NIC)

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 4.32 seconds
           Raw packets sent: 131178 (6.055MB) | Rcvd: 131158 (6.298MB)
