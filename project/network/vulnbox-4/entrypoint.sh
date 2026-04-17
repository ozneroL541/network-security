#!/bin/bash
set -e
ip route replace 172.16.3.0/24 via 172.16.2.4
