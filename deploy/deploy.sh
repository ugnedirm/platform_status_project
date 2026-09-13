#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "Run as root "
    exit 1
fi

PROJECT_DIR="$(pwd)"
SERVICE_NAME="web_application_status.service"

docker compose build

cat > /etc/systemd/system/"$SERVICE_NAME" << EOF
[Unit]
Description=Web application status monitor

[Service]
WorkingDirectory=${PROJECT_DIR}
ExecStart=/usr/bin/docker compose up
ExecStop=/usr/bin/docker compose down
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now "$SERVICE_NAME"

echo "Deployed. Working directory set to: ${PROJECT_DIR}"
systemctl status "$SERVICE_NAME" --no-pager
