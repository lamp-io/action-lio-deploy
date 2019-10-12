FROM php:7.3-cli
COPY entrypoint.sh /entrypoint.sh

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh /

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    jq
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
    && rm -f /tmp/composer-setup.* \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip

# Install nodejs and npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && DEBIAN_FRONTEND=noninteractive apt-get install nodejs -yqq \
    && npm i -g npm

ENV COMPOSER_ALLOW_SUPERUSER=1

ENTRYPOINT ["/entrypoint.sh"]
