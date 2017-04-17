FROM php:5.5-apache

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

ENV XDEBUG_PORT 9000

RUN requirements="libpng12-dev libmcrypt-dev libmcrypt4 libcurl3-dev libfreetype6 libjpeg62-turbo libpng12-dev libfreetype6-dev libjpeg62-turbo-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo \
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

RUN chown -R www-data:www-data /var/www/html
RUN apt-get update && apt-get install -y  apt-utils php5-gd php5-mysql mysql-client-5.5 libxml2-dev git wget zip vim \
    openssh-server openssh-client
RUN docker-php-ext-install soap

# Install oAuth
RUN apt-get update \
	&& apt-get install gcc make autoconf libc-dev pkg-config -y \
	&& apt-get install php-pear -y \
	&& pecl install oauth-1.2.3 \
	&& echo "extension=oauth.so" > /usr/local/etc/php/conf.d/docker-php-ext-oauth.ini

# DevAlias
RUN mkdir ~/.dev-alias \
    && wget https://github.com/rafaelstz/dev-alias/archive/master.zip -P ~/.dev-alias \
    && unzip -qo ~/.dev-alias/master.zip -d ~/.dev-alias \
    && mv ~/.dev-alias/dev-alias-master/* ~/.dev-alias \
    && rm -rf ~/.dev-alias/dev-alias-master \
    && rm ~/.dev-alias/master.zip \
    && echo "source ~/.dev-alias/alias.sh" >> ~/.bashrc

# SSH
#RUN apt-get update && apt-get install -y openssh-server openssh-client
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN usermod -u 1000 www-data

# XDebug
COPY ./xdebug/xdebug-2.2.3.tgz /tmp
#RUN wget http://xdebug.org/files/xdebug-2.2.3.tgz \
#RUN cd /tmp \
#    && tar -xzf xdebug-2.2.3.tgz \
#    && cd xdebug-2.2.3 \
#    && phpize \
#    && ./configure --enable-xdebug \
#    && make \
#    && make install

#RUN apt-get install php5-xdebug -y
#RUN php5enmod xdebug
#RUN echo "zend_extension=xdebug.so" >> /usr/local/etc/php/conf.d/php.ini
#RUN echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/php.ini
# Install XDebug

RUN yes | pecl install xdebug && \
	echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

RUN /etc/init.d/apache2 restart

# Install Composer

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# To SSH
# RUN /usr/sbin/sshd
ADD conf/php.ini /usr/local/etc/php/php.ini
ADD conf/custom-xdebug.ini /usr/local/etc/php/conf.d/custom-xdebug.ini
VOLUME ["/var/www/html"]
WORKDIR /var/www/html
COPY ./magento /var/www/html

CMD ["apache2-foreground", "-DFOREGROUND"]
