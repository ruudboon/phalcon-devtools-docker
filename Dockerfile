FROM php:7.2-cli-alpine

LABEL maintainer="Ruud Boon <github.com/ruudboon>"

ARG PHALCON_VERSION=3.4.2
ARG PHALCON_EXT_PATH=php7/64bits

RUN set -xe && \
        # Compile Phalcon
        curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
        tar xzf ${PWD}/v${PHALCON_VERSION}.tar.gz && \
        docker-php-ext-install -j $(getconf _NPROCESSORS_ONLN) ${PWD}/cphalcon-${PHALCON_VERSION}/build/${PHALCON_EXT_PATH} && \
        # Remove all temp files
        rm -r \
            ${PWD}/v${PHALCON_VERSION}.tar.gz \
            ${PWD}/cphalcon-${PHALCON_VERSION}
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
RUN composer global require phalcon/devtools 
RUN ln -s /root/.composer/vendor/bin/phalcon.php /usr/bin/phalcon && chmod ugo+x /usr/bin/phalcon
WORKDIR /project 
ENTRYPOINT ["phalcon"]