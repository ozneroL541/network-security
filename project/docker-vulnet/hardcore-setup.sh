#!/bin/bash

# DO NOT RUN THIS ON YOUR HOST MACHINE
# VM ONLY

docker_interface="vulnlab0"
docker_subnet="172.30.0.0/22"
interface=$(ip -o -f inet addr show | awk '/scope global/ {print $2}' | head -n 1)
info="$(ip route show dev "$interface")"
subnet=$(echo "$info" | awk '/proto kernel/ {print $1}')
echo $info
echo $subnet
exit

./setup.sh
# Flush everything and start clean
iptables -F FORWARD
iptables -t nat -F POSTROUTING
nft flush chain ip raw PREROUTING

# Allow forwarding between containers
sudo iptables -I FORWARD 1 -s $docker_subnet -d $docker_subnet -j ACCEPT

# Re-add Docker's default NAT rules
iptables -t nat -A POSTROUTING -s $docker_subnet ! -o $docker_interface -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE

# MASQUERADE VM traffic going into Docker bridge
iptables -t nat -A POSTROUTING -s $subnet -o $docker_interface -j MASQUERADE

# Allow forwarding between eth and bridge
iptables -I FORWARD 1 -i $interface -o $docker_interface -j ACCEPT
iptables -I FORWARD 1 -i $docker_interface -o $interface -j ACCEPT

# Allow Docker chain
iptables -I DOCKER 1 -i $interface -d $docker_subnet -j ACCEPT
