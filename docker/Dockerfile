FROM php:7.2-apache

# install php libs
RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip

# enable mod rewrite
COPY ./apache/default.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir /var/www/html/public
RUN a2enmod rewrite && service apache2 restart

WORKDIR /var/www/html/
