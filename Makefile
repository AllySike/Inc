# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kgale <kgale@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/15 14:39:16 by kgale          #+#    #+#              #
#    Updated: 2022/01/07 11:47:15 by kgale            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMP = srcs/docker-compose.yml
SHELL_CLEAN = srcs/clean_all.sh

start:
	@sudo docker-compose -f ${DOCKER-COMP} up

stop:
	@sudo docker-compose -f ${DOCKER-COMP} down
	
re:
	@sudo docker-compose -f ${DOCKER-COMP} up --build

clean:
	@sudo docker system prune -af

fclean:
	bash ${SHELL_CLEAN}

#sudo docker volume rm $(sudo docker volume ls -q) || sudo docker image ls -q | xargs -I {} sudo docker image rm -f {}