#!/bin/bash
set -e

# Générer des certificats auto-signés si non présents
if [ ! -f /etc/nginx/ssl/nginx.crt ] || [ ! -f /etc/nginx/ssl/nginx.key ]; then
	echo "Generating self-signed certificate..."
	mkdir -p /etc/nginx/ssl
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/CN=localhost"
fi

# Lancer NGINX en mode foreground
echo "Starting NGINX..."
exec nginx -g "daemon off;"