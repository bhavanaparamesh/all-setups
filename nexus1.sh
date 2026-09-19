#!/bin/bash

set -e

sudo dnf update -y
sudo dnf install -y wget java-21-amazon-corretto

java -version

sudo mkdir -p /app
cd /app

sudo wget -O nexus.tar.gz \
https://download.sonatype.com/nexus/3/nexus-3.96.2-01-linux-x86_64.tar.gz

sudo tar -xzf nexus.tar.gz
sudo rm -f nexus.tar.gz

sudo mv nexus-3.96.2-01 nexus

sudo useradd --system --shell /bin/bash nexus 2>/dev/null || true

sudo mkdir -p /app/sonatype-work/nexus3

sudo chown -R nexus:nexus /app/nexus
sudo chown -R nexus:nexus /app/sonatype-work

echo 'run_as_user="nexus"' | sudo tee /app/nexus/bin/nexus.rc

sudo tee /etc/systemd/system/nexus.service > /dev/null <<'EOF'
[Unit]
Description=Nexus Repository Manager
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/app/nexus/bin/nexus start
ExecStop=/app/nexus/bin/nexus stop
Restart=on-abort
TimeoutStartSec=600

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable nexus
sudo systemctl start nexus

sleep 30

sudo systemctl status nexus --no-pager
