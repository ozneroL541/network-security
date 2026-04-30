#!/bin/bash
# Stop and remove any existing containers
docker compose down --remove-orphans
# Start the vulnbox network
docker compose up --build --remove-orphans -d
# Allow forwarding between containers
sudo iptables -I FORWARD 1 -s 172.30.0.0/22 -d 172.30.0.0/22 -j ACCEPT
# Remove the default IP addresses from the bridge interfaces
sudo ip addr del 172.30.1.254/24 dev vulnlab1
sudo ip addr del 172.30.2.254/24 dev vulnlab2
sudo ip addr del 172.30.3.254/24 dev vulnlab3
# Host
# Tell your physical machine to send lab traffic to vulnbox1
sudo ip route replace 172.30.1.0/24 via 172.30.0.2
sudo ip route replace 172.30.2.0/24 via 172.30.0.2
sudo ip route replace 172.30.3.0/24 via 172.30.0.2
# vulnbox1
docker exec -u 0 vulnbox1 sysctl -w net.ipv4.ip_forward=1
docker exec -u 0 vulnbox1 ip route replace 172.30.2.0/24 via 172.30.1.2
docker exec -u 0 vulnbox1 ip route replace 172.30.3.0/24 via 172.30.1.2
docker exec -u 0 vulnbox1 ip route add default via 172.30.0.1
# vulnbox2
docker exec -u 0 vulnbox2 sysctl -w net.ipv4.ip_forward=1
docker exec -u 0 vulnbox2 ip route replace 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox2 ip route add default via 172.30.1.1
# vulnbox3
docker exec -u 0 vulnbox3 ip route add 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox3 ip route add default via 172.30.2.1
# vulnbox4
docker exec -u 0 vulnbox4 ip route replace 172.30.3.0/24 via 172.30.2.4
docker exec -u 0 vulnbox4 ip route add default via 172.30.2.1
# vulnbox5
docker exec -u 0 vulnbox5 sysctl -w net.ipv4.ip_forward=1
docker exec -u 0 vulnbox5 ip route add default via 172.30.2.1
# vulnbox6
docker exec -u 0 vulnbox6 ip route add default via 172.30.3.1
