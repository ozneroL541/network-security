#!/bin/sh
set -eu

ROLE="${NODE_ROLE:-target-ssh}"

add_route() {
  cidr="$1"
  via="$2"

  if [ -n "$cidr" ] && [ -n "$via" ]; then
    ip route replace "$cidr" via "$via" || true
  fi
}

seed_routes() {
  add_route "${ROUTE_NET1:-}" "${ROUTE_NET1_VIA:-}"
  add_route "${ROUTE_NET2:-}" "${ROUTE_NET2_VIA:-}"
  add_route "${ROUTE_NET3:-}" "${ROUTE_NET3_VIA:-}"
}

start_ssh() {
  mkdir -p /run/sshd
  ssh-keygen -A >/dev/null 2>&1 || true
  /usr/sbin/sshd
}

start_http() {
  cat > /srv/www/index.html <<'EOF'
<html>
  <head><title>Lab target</title></head>
  <body>
    <h1>Intentionally Vulnerable Target</h1>
    <p>This host is part of a controlled security lab.</p>
    <p>Default credentials are intentionally weak.</p>
  </body>
</html>
EOF
  busybox httpd -f -p 80 -h /srv/www &
}

case "$ROLE" in
  router)
    sysctl -w net.ipv4.ip_forward=1 >/dev/null || true
    seed_routes
    ;;
  target-web)
    seed_routes
    start_ssh
    start_http
    ;;
  target-ssh)
    seed_routes
    start_ssh
    ;;
  target-mixed)
    seed_routes
    start_ssh
    start_http
    ;;
  *)
    echo "Unknown NODE_ROLE: $ROLE" >&2
    exit 1
    ;;
esac

# Keep the container alive while background services run.
exec tail -f /dev/null
