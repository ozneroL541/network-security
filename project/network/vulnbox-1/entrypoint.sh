#!/bin/bash
set -e
ip route add 172.16.1.0/24 via 172.16.0.2 || true
ip route add 172.16.2.0/24 via 172.16.0.2 || true
ip route add 172.16.3.0/24 via 172.16.0.2 || true
exec sleep infinity
