FROM ubuntu:xenial

MAINTAINER Andrei Susanu <andrei.susanu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# update system and existing packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove

# install php7.0 package and popular extensions
RUN apt-get install -y --no-install-recommends \
    php7.0-fpm php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-soap php7.0-sqlite3 php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip

# configure php7.0-fpm as non-daemon
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf

# php7.0-fpm will not start if this directory does not exist
RUN mkdir /run/php

# install nginx package
RUN apt-get install -y --no-install-recommends nginx

# configure NGINX as non-daemon
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# install supervisor package
RUN apt-get install -y --no-install-recommends supervisor

# copy config file for Supervisor
COPY config/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# backup default default config for NGINX
RUN cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# copy local defualt config file for NGINX
COPY config/nginx/default /etc/nginx/sites-available/default

# add a phpinfo script for debug purposes
RUN echo "<?php phpinfo();" >> /var/www/html/index.php

# NGINX mountable directories for config and logs
VOLUME ["/etc/nginx/conf.d", "/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# NGINX mountable directory for apps
VOLUME ["/var/www"]

# NGINX ports
EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
