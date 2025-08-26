#!/bin/bash
set -e

APP_DIR="/home/site/wwwroot"
cd "$APP_DIR"

# Zorg dat storage en cache bestaan en schrijfbaar zijn
mkdir -p storage/framework/{sessions,views,cache} bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache || true
chmod -R ug+rwX storage bootstrap/cache || true

# Start je Laravel queue worker 
exec php artisan queue:work --sleep=5 --tries=3 --timeout=90
