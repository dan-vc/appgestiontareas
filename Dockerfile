# Imagen base oficial de PHP con extensiones necesarias
FROM php:8.2-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev curl \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instalar Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Copiar archivos del proyecto
WORKDIR /var/www/html
COPY . .

# Instalar dependencias de Laravel
RUN composer install --no-dev --optimize-autoloader

# Generar clave de aplicación si no existe
RUN php artisan key:generate --force

# Dar permisos a storage y bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Puerto de ejecución
EXPOSE 8080

# Comando de inicio
CMD php artisan serve --host=0.0.0.0 --port=8080
