FROM alpine:3.3

MAINTAINER lw6c@qq.com

# Install packages
RUN apk update && apk add s6 \
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
RUN chmod +x /etc/services.d/nginx/* && chmod +x /etc/services.d/php-fpm/*

# Fix permissions
RUN chown -Rf nginx:www-data /var/www/

# Set working directory
WORKDIR /var/www

# Expose the ports for nginx
EXPOSE 80 443

CMD ["s6-svscan", "/etc/services.d"]