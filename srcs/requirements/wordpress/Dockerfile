FROM alpine:3.14

WORKDIR /var/www/html

RUN apk update && \
    apk --no-cache add \
    php7 php7-fpm \
    wget tar

COPY tools/script.sh /

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/script.sh"]