FROM debian:bullseye

WORKDIR /

RUN apt update -y && apt install -y nginx openssl

COPY config/config.conf /etc/nginx/sites-available/default

COPY tools/script.sh /usr/local/bin/server_script

RUN chmod +x /usr/local/bin/server_script

ENTRYPOINT ["server_script"]

CMD ["nginx", "-g", "daemon off;"]