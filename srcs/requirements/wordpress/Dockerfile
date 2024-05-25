FROM alpine:3.14

WORKDIR /var/www/html

RUN apk --no-cache add \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-xmlwriter \
    php7-simplexml \
    php7-tokenizer \
    php7-ctype \
    php7-session \
    php7-mbstring \
    postfix \
    wget curl tar 

COPY tools/script.sh /

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/script.sh"]