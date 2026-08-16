#!/bin/bash
# Install Nginx and write a simple index.html
set -e
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
cat > /var/www/html/index.html <<'EOF'
<html>
  <head><title>Welcome</title></head>
  <body>
    <h1>Welcome to Nginx on Azure</h1>
    <p>Provisioned by Terraform module nginx_vm</p>
  </body>
</html>
EOF
systemctl enable --now nginx
