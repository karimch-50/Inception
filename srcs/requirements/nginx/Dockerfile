FROM debian:bullseye

WORKDIR /

RUN  apt update -y && apt install nginx -y

COPY config/config.conf /etc/nginx/sites-available/default

# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx

CMD ["nginx", "-g", "daemon off;"]