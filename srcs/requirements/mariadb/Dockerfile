FROM debian:bullseye

WORKDIR /

RUN apt update

RUN apt upgrade -y

RUN apt install mariadb-server -y

COPY tools/script.sh /usr/local/bin/db_script

RUN chmod +x /usr/local/bin/db_script

CMD ["db_script"]