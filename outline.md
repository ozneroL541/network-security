- cos'è un vulnerability assessment, come vengono effettuati

- introduction to the tool: 
	- spiegare il tool
	- funzionalità
	- metodologie (far vedere interfaccia, spiegare come usarlo), 
	- cosa cambia da versione free a versione a pagamento, 
	- database di vulenaribilità
	- far vedere il database
	- var vedere sistema bear metal e quello in virtualbox spiegando differenze di utilizzo e perchè conviene vbox
	- spiegazione rete 
		- creazione virtual lan su vbox
		- mettere gateway su greenbone
		- vm spiegazione
		- rete docker
		- come è stata configurata
		- tirare su vm senza interfaccia
		- tirare su la rete docker (docker-vulnnet)
		- far partire network discovery (dicendogli che ci metterà un botto e che magari non vedranno nemmeno il risultato)
		- pausa 5 minuti esercizio
		- fai vedere tu il report e spieghi qualcosa
		
- VM analysis
	- windows xp
		- perchè scelto
		- firewall inesistente bit
		- servizi vulnerabili
			- ftp credenziali Anonymous password qualunque
	- debian
		- scelta
		- servizi (leggi nel pdf report)
			- apache
			- cups
			- docker vulnnet
			- FTP
			- Samba
			- SSH
			- Syslog
	
	- devono capire quali ip siano dinamici
	- far vedere tutta l'interfaccia wek UI, spiegando configurazioni:
		- 
	
	- Spiegazione vm e servizi
		- feed parte più importante perchè sennò non sa che vulnerabilità cercare, controllare che sia updated e che non sia in updating altrimenti nulla va
		- far vedere pannello configuration (ci avrebbe messo troppo altrimenti e praticamente è nmap)
		- credentials permette di far l'accesso con credenziali specifiche soltanto ad ssh e samba
		- creazione target
		- task
		- results Vari report e commento
			- Spiegare giusto due cose sulle vulnerabilità più importanti
			- cosa possono comportare queste vulnerabilità
			- spiegare che tramite greenbone abbiamo una pagina http esposta su xp






(base) wr3nch@nameless-enterprise:~/Documents/Network Security/project/network-security$ sudo nmap -sS -sU -p- -T4 -v 192.168.56.101
[sudo] password for wr3nch: 
Starting Nmap 7.92 ( https://nmap.org ) at 2026-05-04 17:13 CEST
Initiating ARP Ping Scan at 17:13
Scanning 192.168.56.101 [1 port]
Completed ARP Ping Scan at 17:13, 0.20s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 17:13
Completed Parallel DNS resolution of 1 host. at 17:13, 0.21s elapsed
Initiating SYN Stealth Scan at 17:13
Scanning 192.168.56.101 [65535 ports]
Discovered open port 80/tcp on 192.168.56.101
Discovered open port 1025/tcp on 192.168.56.101
Discovered open port 135/tcp on 192.168.56.101
Discovered open port 443/tcp on 192.168.56.101
Discovered open port 445/tcp on 192.168.56.101
Discovered open port 21/tcp on 192.168.56.101
Discovered open port 139/tcp on 192.168.56.101
Discovered open port 25/tcp on 192.168.56.101
Discovered open port 1032/tcp on 192.168.56.101
Discovered open port 1026/tcp on 192.168.56.101
Discovered open port 1027/tcp on 192.168.56.101
Discovered open port 9/tcp on 192.168.56.101
Discovered open port 2107/tcp on 192.168.56.101
Discovered open port 2103/tcp on 192.168.56.101
Discovered open port 5000/tcp on 192.168.56.101
Discovered open port 2105/tcp on 192.168.56.101
Discovered open port 19/tcp on 192.168.56.101
Discovered open port 1801/tcp on 192.168.56.101
Discovered open port 7/tcp on 192.168.56.101
Discovered open port 13/tcp on 192.168.56.101
Discovered open port 17/tcp on 192.168.56.101
Completed SYN Stealth Scan at 17:13, 2.62s elapsed (65535 total ports)
Initiating UDP Scan at 17:13
Scanning 192.168.56.101 [65535 ports]
Discovered open port 13/udp on 192.168.56.101
Discovered open port 137/udp on 192.168.56.101
Discovered open port 161/udp on 192.168.56.101
Discovered open port 19/udp on 192.168.56.101
Discovered open port 1029/udp on 192.168.56.101
Discovered open port 135/udp on 192.168.56.101
Discovered open port 123/udp on 192.168.56.101
Discovered open port 17/udp on 192.168.56.101
Discovered open port 1028/udp on 192.168.56.101
Discovered open port 7/udp on 192.168.56.101
Completed UDP Scan at 17:13, 4.75s elapsed (65535 total ports)
Nmap scan report for 192.168.56.101
Host is up (0.00017s latency).
Not shown: 65516 closed udp ports (port-unreach), 65514 closed tcp ports (reset)
PORT     STATE         SERVICE
7/tcp    open          echo
9/tcp    open          discard
13/tcp   open          daytime
17/tcp   open          qotd
19/tcp   open          chargen
21/tcp   open          ftp
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
1029/udp open          solid-mux
1031/udp open|filtered iad2
1900/udp open|filtered upnp
3456/udp open|filtered IISrpc-or-vat
3527/udp open|filtered beserver-msg-q
MAC Address: 08:00:27:CE:82:01 (Oracle VirtualBox virtual NIC)

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 8.00 seconds
           Raw packets sent: 131104 (6.049MB) | Rcvd: 131083 (6.293MB)


