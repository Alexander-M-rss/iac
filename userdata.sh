#!/bin/bash

# Retrieve instance metadata using IMDSv2 immediately (no external network needed)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

# Create the HTML page immediately before any package install
mkdir -p /var/www/html
cat > /var/www/html/index.html <<'HTML'
<html>
<body>
<p>This message was generated on instance INSTANCE_ID_PLACEHOLDER with the following IP: PRIVATE_IP_PLACEHOLDER</p>
</body>
</html>
HTML

# Replace placeholders with real values
sed -i "s/INSTANCE_ID_PLACEHOLDER/$INSTANCE_ID/g" /var/www/html/index.html
sed -i "s/PRIVATE_IP_PLACEHOLDER/$PRIVATE_IP/g" /var/www/html/index.html

# Try httpd with a fast timeout (seconds); fall back to Python if unavailable
if dnf install -y httpd --setopt=timeout=10 --setopt=retries=0 2>/dev/null; then
  systemctl enable httpd
  systemctl start httpd
else
  # Python3 is always present on AL2023 - use it as the web server
  cat > /etc/systemd/system/pyhttp.service <<'SVC'
[Unit]
Description=Python HTTP Server
After=network.target

[Service]
WorkingDirectory=/var/www/html
ExecStart=/usr/bin/python3 -m http.server 80
Restart=always

[Install]
WantedBy=multi-user.target
SVC
  systemctl daemon-reload
  systemctl enable pyhttp
  systemctl start pyhttp
fi
