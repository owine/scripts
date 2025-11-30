#!/bin/bash
set -euo pipefail

API_URL="https://dashboard.datahorders.org/api/user/v1/cdn-nodes"
DASHBOARD_API_KEY="your_api_key"

DOMAINS=$(curl -s -H "X-API-Key: ${DASHBOARD_API_KEY}" -H "Accept: application/json" "${API_URL}" | jq -r '.[].domain')

IPS=()
for domain in ${DOMAINS}; do
    ip=$(dig +short "${domain}" A | head -n1)
    [[ -n "${ip}" ]] && IPS+=("${ip}")
done

IFS=','; echo "${IPS[*]}"
