FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libpq-dev git libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_pgsql pgsql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/symfony
