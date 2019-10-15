FROM alipeng/php7-cli-alpine

LABEL maintainer Alipeng <alipeng@aliyun.com>

ENV TZ=Asia/Shanghai \
    PHP_USER_ID=82 \
    PATH=/root/.composer/vendor/bin:$PATH \
    TERM=linux \
    COMPOSER_ALLOW_SUPERUSER=1

RUN set -xe \
    && apk add --no-cache \
        curl \
        wget \
        git \
        bash \
        vim \
        mysql-client \
        openssh-client \
        redis \
        tree \
        tzdata \
        less \
        nodejs \
        yarn \
	rsync \
    && curl -sS https://getcomposer.org/installer | php -- \
            --filename=composer \
            --install-dir=/usr/local/bin \
    &&  composer clear-cache \
    && cp -rf /usr/share/zoneinfo/$TZ /etc/localtime \
    && wget https://psysh.org/psysh \
    && chmod +x psysh \
    && mv psysh /usr/local/bin \
    && yarn global add pm2

WORKDIR /var/www

ENTRYPOINT [ "bash" ]
