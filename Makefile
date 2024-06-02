# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kchaouki <kchaouki@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/18 16:27:43 by kchaouki          #+#    #+#              #
#    Updated: 2024/06/02 00:50:11 by kchaouki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

init:
	bash srcs/requirements/tools/script.sh

up : init
	@docker-compose -f srcs/docker-compose.yml up --build -d

down : 
	@docker-compose -f srcs/docker-compose.yml down

re: clean down up

clean:
	@docker volume rm $(docker volume ls -q) 2> /dev/null ; true
	@rm -rf /home/kchaouki/data/database/*
	@rm -rf /home/kchaouki/data/wordpress/*

fclean: clean
	docker rm -f $(docker ps -qa)
	docker rmi -f $(docker images -qa)

status : 
	@docker ps

logs:
	@docker-compose -f srcs/docker-compose.yml logs -f

nginx_logs:
	@docker-compose -f srcs/docker-compose.yml logs nginx

wordpress_logs:
	@docker-compose -f srcs/docker-compose.yml logs wordpress

mariadb_logs:
	@docker-compose -f srcs/docker-compose.yml logs mariadb

.PHONY: all init up down re clean fclean status logs nginx_logs wordpress_logs mariadb_logs