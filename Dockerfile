FROM php:5.5-apache

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

WORKDIR /var/www/htdocs
COPY ./src /var/www/htdocs
EXPOSE 80

RUN requirements="libpng12-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libpng12-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && requirementsToRemove="libpng12-dev libmcrypt-dev libcurl3-dev libpng12-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

RUN usermod -u 1000 www-data
RUN a2enmod rewrite
RUN sed -i -e 's/\/var\/www\/html/\/var\/www\/htdocs/' /etc/apache2/apache2.conf

RUN chown -R www-data:www-data /var/www/htdocs
RUN apt-get update && apt-get install -y mysql-client-5.5 libxml2-dev wget zip vim
RUN docker-php-ext-install soap

RUN mkdir ~/.dev-alias \
    && wget https://github.com/rafaelstz/dev-alias/archive/master.zip -P ~/.dev-alias \
    && unzip -qo ~/.dev-alias/master.zip -d ~/.dev-alias \
    && mv ~/.dev-alias/dev-alias-master/* ~/.dev-alias \
    && rm -rf ~/.dev-alias/dev-alias-master \
    && rm ~/.dev-alias/master.zip \
    && echo "source ~/.dev-alias/alias.sh" >> ~/.bashrc
