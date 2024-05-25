FROM debian:bookworm

WORKDIR /

RUN apt update && apt upgrade -y && \
    apt install mariadb-server -y

COPY tools/script.sh /

ENTRYPOINT ["/bin/sh", "/script.sh"]
