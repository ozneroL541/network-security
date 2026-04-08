#!/bin/bash

# Add a route to send packets destined for 172.16.0.0/24 to 172.16.0.2
sudo ip route add 172.16.0.0/24 via 172.16.0.2

# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Add NAT rule to masquerade packets destined for 172.16.0.0/24
sudo iptables -t nat -A POSTROUTING -d 172.16.0.0/24 -j MASQUERADE
