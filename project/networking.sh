#!/bin/bash

# Add a route to send packets destined for 172.16.0.0/24 to 172.16.0.2
sudo ip route add 172.16.0.0/24 via 172.16.0.2
# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Add NAT rule to masquerade outgoing packets
sudo iptables -t nat -A POSTROUTING -o br-50a304b40423 -j MASQUERADE

# Allow forwarding of packets to and from the vulnerable box
sudo iptables -A FORWARD -d 172.16.0.2 -j ACCEPT
sudo iptables -A FORWARD -s 172.16.0.2 -j ACCEPT

# Add NAT rule to masquerade packets going to the vulnerable box
sudo iptables -t nat -A POSTROUTING -d 172.16.0.2 -j MASQUERADE

# Verify the route was added
ip route show
