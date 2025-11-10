#!/usr/bin/env bash

echo "Instalando extensión MongoDB..."
pecl install -f mongodb
docker-php-ext-enable mongodb

echo "Running composer"
composer install --no-dev --working-dir=/var/www/html

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force