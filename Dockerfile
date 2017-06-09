FROM alpine:3.3

MAINTAINER Michael Dimmock <https://github.com/michaeldim>

# Install packages
RUN apk update && apk add execlineb \
    nginx \
    bash \
    curl \
    git \
    php-cli \
    php-curl \
    php-dom \
    php-gd \
    php-fpm \
    php-json \
    php-mcrypt \
    php-mysql \
    php-pdo_mysql \
    php-phar \
    php-iconv \
    php-openssl && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    rm -Rf /var/www/*

# Copy configuration files to root
COPY rootfs /

# Fix permissions
RUN chown -Rf nginx:www-data /var/www/

# Set working directory
WORKDIR /var/www

# Expose the ports for nginx
EXPOSE 80 443
