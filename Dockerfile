FROM php:8.1-fpm

# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    && docker-php-ext-install pdo pdo_mysql \
    && echo "clear_env = no" >> /usr/local/etc/php-fpm.d/www.conf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Copy the codebase and set permissions (for production/build mode)
COPY --chown=www-data:www-data . /var/www/html

# Set permissions recursively
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
