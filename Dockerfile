FROM php:8.2-apache

# On force l'update et l'install des dépendances
RUN apt-get update && apt-get install -y libmariadb-dev
RUN docker-php-ext-install pdo pdo_mysql
RUN a2enmod rewrite