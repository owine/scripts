If you are using Saltbox and need to trust the headers from the CDN, deploy the `get-cdn-ips.sh` script from this repo somewhere on your server and `chmod +x` the script. Make sure to add your Datahorders Dashboard API key.

Add the following to your Saltbox inventory:

`traefik_trusted_ips: "{{ lookup('ansible.builtin.pipe', '/path/to/get-cdn-ips.sh') }}"`

Upon running `sb install traefik` or anything else that invokes the Traefik role, the `get-cdn-ips.sh` script will be executed at runtime to grab the current CDN endpoints from the API. They will then be resolved to IPs and Traefik will trust headers passed from those IPs (such as X-Forwarded-IP.)
