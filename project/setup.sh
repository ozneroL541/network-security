#!/bin/bash
sudo docker compose up --build --remove-orphans -d

sudo iptables -I FORWARD 1 -s 172.30.0.0/22 -d 172.30.0.0/22 -j ACCEPT

# Host
# Tell your physical machine to send lab traffic to vulnbox1
sudo ip route replace 172.30.1.0/24 via 172.30.0.2
sudo ip route replace 172.30.2.0/24 via 172.30.0.2
sudo ip route replace 172.30.3.0/24 via 172.30.0.2

# vulnbox1
sudo docker exec -u 0 vulnbox1 sysctl -w net.ipv4.ip_forward=1
# Route to net2 and net3 via vulnbox2
sudo docker exec -u 0 vulnbox1 ip route replace 172.30.2.0/24 via 172.30.1.2
sudo docker exec -u 0 vulnbox1 ip route replace 172.30.3.0/24 via 172.30.1.2
sudo docker exec -u 0 vulnbox1 ip route add default via 172.30.0.1

# vulnbox2
sudo docker exec -u 0 vulnbox2 sysctl -w net.ipv4.ip_forward=1
sudo docker exec -u 0 vulnbox2 ip route replace 172.30.3.0/24 via 172.30.2.4
sudo docker exec -u 0 vulnbox2 ip route add default via 172.30.1.1

# vulnbox3
sudo docker exec -u 0 vulnbox3 ip route add 172.30.3.0/24 via 172.30.2.4
sudo docker exec -u 0 vulnbox3 ip route add default via 172.30.2.1

# vulnbox4
sudo docker exec -u 0 vulnbox4 ip route replace 172.30.3.0/24 via 172.30.2.4
sudo docker exec -u 0 vulnbox4 ip route add default via 172.30.2.1


# vulnbox5
sudo docker exec -u 0 vulnbox5 sysctl -w net.ipv4.ip_forward=1
sudo docker exec -u 0 vulnbox5 ip route add default via 172.30.2.1

# vulnbox6
#sudo docker exec -u 0 vulnbox6 ip route add default via 172.30.3.1
