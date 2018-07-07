FROM ubuntu:16.04
MAINTAINER Raju Dawadi

# Install apache, PHP, and supplimentary programs

RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur php7.0-gd php7.0-zip php7.0-dom php7.0-common php7.0-curl php7.0-mbstring php-dev php7.0-bcmath \
    php-curl nano supervisor git wget re2c pkg-config autoconf cmake && \
    curl -s http://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer && \
    composer global require hirak/prestissimo


# Enable apache mods.
RUN a2enmod php7.0 && a2enmod rewrite && a2enmod proxy_http && a2enmod headers

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini && \
    sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini && \
    sed -i "s/display_errors = .*$/display_errors = On/" /etc/php/7.0/apache2/php.ini && \
    mkdir -p /var/www/app/public

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

#copy essential config + files
COPY apache2.conf /etc/supervisor/conf.d
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose apache.
EXPOSE 80

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
