FROM alpine:latest

WORKDIR /

RUN apk update && apk add nginx

COPY index.html /

COPY config/config.conf /etc/nginx/http.d

# ENTRYPOINT ["nginx", "-g", "daemon off;"]

# EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# CMD ["nginx -g deamon-off"]