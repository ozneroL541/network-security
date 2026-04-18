#!/bin/bash
set -e
ip route add 172.30.2.0/24 via 172.30.1.2
ip route add 172.30.3.0/24 via 172.30.1.2
ip route add default via 172.30.0.1
