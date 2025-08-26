#!/bin/bash
set -e

APP_DIR="/home/site/wwwroot"
cd "$APP_DIR"

# Zelfde preflight (optioneel, maar handig)
mkdir -p storage/framework/{sessions,views,cache} bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache || true
chmod -R ug+rwX storage bootstrap/cache || true

# Start de agent zoals in je supervisor-config
exec php artisan nightwatch:agent
