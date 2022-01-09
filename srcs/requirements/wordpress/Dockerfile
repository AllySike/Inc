# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kgale <kgale@21-school.ru>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/02 16:06:20 by kgale          #+#    #+#              #
#    Updated: 2021/07/27 17:13:24 by kgale         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get -y install unzip wget vim  && \
	apt-get -y install php7.3 php-mysqli php-fpm wget php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN apt-get -y install htop

COPY . .

RUN cp conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf && service php7.3-fpm start

RUN chmod 755 ./tools/wp_create.sh

EXPOSE 9000

ENTRYPOINT ["bash", "./tools/wp_create.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

