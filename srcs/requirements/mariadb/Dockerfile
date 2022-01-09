# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kgale <kgale@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/15 14:49:26 by kgale          #+#    #+#              #
#    Updated: 2022/01/08 22:56:29 by kgale            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

EXPOSE 3306

RUN apt-get update 
RUN apt-get install -y mariadb-server vim 
RUN apt-get -y install procps

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 444 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY /tools/starting_mariadb.sh      /var/www/
RUN chmod 755 /var/www/starting_mariadb.sh 
ENTRYPOINT ["bash", "/var/www/starting_mariadb.sh"]
