# Docker Security Lab

This stack creates a segmented 3-network lab with:
- Multi-homed router nodes (`node2`, `node4`, `node6`)
- Vulnerable targets with weak SSH/HTTP configs for scanning
- Designed to work with locally installed OpenVAS or similar scanner

## Quick start

1. Ensure your local OpenVAS is running and accessible
2. Start the lab network:
   - `docker compose -f compose.yml up -d --build`
3. Check status:
   - `docker compose -f compose.yml ps`
4. Run scans via your local OpenVAS against target node IPs (see below)

## Useful commands

- Show network routes on `node3`:
  - `docker exec -it node3 ip route`
- Test reachability from scanner network host (`node1`) to net3 target:
  - `docker exec -it node1 ping -c 2 172.30.3.11`
- SSH into a target (user: vulnuser, pass: vulnpass):
  - `docker exec -it node3 nc -z localhost 22 && echo SSH open`
- Stop stack:
  - `docker compose -f compose.yml down`

## Network topology for scanning

**Target IPs:**
- `node1` (net1): 172.30.1.11 — SSH (22) + HTTP (80)
- `node3` (net2): 172.30.2.11 — SSH (22)
- `node5` (net3): 172.30.3.11 — SSH (22) + HTTP (80)

**Cross-network routing via bridge nodes:**
- net1 ↔ net2: through node2 (172.30.1.2 ↔ 172.30.2.2)
- net2 ↔ net3: through node4 (172.30.2.3 ↔ 172.30.3.3)
- net1 ↔ net3: through node6 (172.30.1.3 ↔ 172.30.3.2)

## Notes

- This environment is intentionally insecure and must remain lab-only.
- Credentials: user `vulnuser` / pass `vulnpass` or `root` / `toor`
- Resource limits are set to fit an 8GB host budget.
