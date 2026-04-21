#!/bin/bash
sudo iptables -I FORWARD 1 -s 172.30.0.0/22 -d 172.30.0.0/22 -j ACCEPT

# --- 1. HOST ROUTES ---
# Tell your physical machine to send lab traffic to vulnbox1
sudo ip route replace 172.30.1.0/24 via 172.30.0.2
sudo ip route replace 172.30.2.0/24 via 172.30.0.2
sudo ip route replace 172.30.3.0/24 via 172.30.0.2

# --- 2. VULNBOX 1 (The Entrance) ---
docker exec -u 0 vulnbox1 sysctl -w net.ipv4.ip_forward=1
# Route to net2 and net3 via vulnbox2
docker exec -u 0 vulnbox1 ip route replace 172.30.2.0/24 via 172.30.1.2
docker exec -u 0 vulnbox1 ip route replace 172.30.3.0/24 via 172.30.1.2
docker exec -u 0 vulnbox1 ip route add default via 172.30.0.1

# --- 3. VULNBOX 2 (The Middleman) ---
docker exec -u 0 vulnbox2 sysctl -w net.ipv4.ip_forward=1
docker exec -u 0 vulnbox2 ip route replace 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox2 ip route add default via 172.30.1.1

# --- 3. VULNBOX 3 ---
docker exec -u 0 vulnbox3 ip route add 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox3 ip route add default via 172.30.2.1

# --- 4. VULNBOX 4 ---
docker exec -u 0 vulnbox4 ip route replace 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox4 ip route add default via 172.30.2.1


# Vulnbox 5 (Another Router):
docker exec -u 0 vulnbox5 sysctl -w net.ipv4.ip_forward=1
docker exec -u 0 vulnbox5 ip route add default via 172.30.2.1

# Vulnbox 6: Use vulnbox5 as the exit
docker exec -u 0 vulnbox6 ip route add default via 172.30.3.1
