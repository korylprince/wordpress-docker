ARG VERSION
FROM wordpress:$VERSION

RUN apt-get update && apt-get install -y \
        libldap2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) ldap

COPY php.ini $PHP_INI_DIR/conf.d/custom.ini
