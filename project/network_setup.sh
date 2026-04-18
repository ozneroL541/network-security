#!/bin/bash

# Define the Map: Subnet -> Which IP should be the Gateway
# net1 (172.30.1.0) -> vulnbox1 (172.30.1.1)
# net2 (172.30.2.0) -> vulnbox2 (172.30.2.1)
# net3 (172.30.3.0) -> vulnbox5 (172.30.3.1)

declare -A GATEWAYS=( 
    ["172.30.1"]="172.30.1.1" 
    ["172.30.2"]="172.30.2.1" 
    ["172.30.3"]="172.30.3.1" 
)

echo "[*] Starting Gateway Migration..."

for container in $(docker ps --format '{{.Names}}'); do
    # Get the IP address of the container
    IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container)
    
    # Extract the prefix (e.g., 172.30.2)
    PREFIX=$(echo $IP | cut -d'.' -f1-3)

    # Check if this subnet has a custom gateway defined in our map
    if [[ -n "${GATEWAYS[$PREFIX]}" ]]; then
        NEW_GW="${GATEWAYS[$PREFIX]}"
        
        # Don't make a container its own gateway (prevents infinite loops)
        if [[ "$IP" != "$NEW_GW" ]]; then
            echo "[>] Updating $container ($IP) to use Gateway $NEW_GW"
            
            # Remove Docker's default and add the Vulnbox
            docker exec -u 0 "$container" ip route del default 2>/dev/null
            docker exec -u 0 "$container" ip route add default via "$NEW_GW"
        fi
    fi
done

echo "[+] Done. Internal traffic is now routed through your pivot boxes."
