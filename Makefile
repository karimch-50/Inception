# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kchaouki <kchaouki@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/18 16:27:43 by kchaouki          #+#    #+#              #
#    Updated: 2024/05/18 16:30:20 by kchaouki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	@docker-compose -f srcs/docker-compose.yml up -d

down : 
	@docker-compose -f srcs/docker-compose.yml down

stop : 
	@docker-compose -f srcs/docker-compose.yml stop

start : 
	@docker-compose -f srcs/docker-compose.yml start

restart	:
	@docker-compose -f srcs/docker-compose.yml restart

status : 
	@docker ps

logs:
	@docker-compose -f srcs/docker-compose.yml logs -f

nginx_logs:
	docker-compose -f srcs/docker-compose.yml logs nginx

wordpress_logs:
	docker-compose -f srcs/docker-compose.yml logs wordpress

mariadb_logs:
	docker-compose -f srcs/docker-compose.yml logs mariadb

.PHONY: up down stop start restart status logs

