#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux Personal Server Setup =====${RESET}"

# Function to install a package if it's not already installed
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        pkg install -y $1
    else
        echo "$1 is already installed."
    fi
}

# Install necessary packages
install_package nginx
install_package php
install_package mariadb

# Start MariaDB
echo "Starting MariaDB..."
mysqld_safe &

# Configure Nginx
echo "Configuring Nginx..."
mkdir -p "$HOME/webroot"
echo "<?php phpinfo(); ?>" > "$HOME/webroot/index.php"

cat > "$PREFIX/etc/nginx/nginx.conf" << EOF
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       8080;
        server_name  localhost;
        root         $HOME/webroot;
        index        index.html index.htm index.php;
        location ~ \.php$ {
            fastcgi_pass   unix:$PREFIX/var/run/php-fpm.sock;
            fastcgi_index  index.php;
            include        fastcgi.conf;
        }
    }
}
EOF

# Start Nginx
echo "Starting Nginx..."
nginx

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm

echo -e "${GREEN}Personal server setup complete!${RESET}"
echo -e "Your web server is now running. You can access it at:"
echo -e "${YELLOW}http://localhost:8080${RESET}"
echo "Place your web files in $HOME/webroot"