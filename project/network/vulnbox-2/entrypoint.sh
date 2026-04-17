#!/bin/bash
set -e
ip route add 172.16.3.0/24 via 172.16.2.4 || true
ip route add default via 172.16.1.1 || true
exec sleep infinity
