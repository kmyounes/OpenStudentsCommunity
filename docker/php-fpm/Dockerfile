FROM php:fpm-alpine

RUN docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql

WORKDIR "/application"
