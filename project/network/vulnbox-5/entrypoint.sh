#!/bin/bash
set -e
ip default via 172.16.2.1 || true
exec sleep infinity
