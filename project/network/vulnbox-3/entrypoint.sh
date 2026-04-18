#!/bin/bash
set -e
ip route add 172.30.3.0/24 via 172.30.2.4
ip route add default via 172.30.2.1
