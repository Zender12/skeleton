FROM    php:7.2.0-apache
MAINTAINER Ruslan Kaliusha <zenderrr12@gmail.com>

RUN a2enmod rewrite &&\
	a2enmod headers &&\
	a2enmod ssl

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update && apt-get -y install mc sshpass ssh build-essential git mysql-utilities mysql-client openssh-client zlib1g-dev libcurl4-openssl-dev curl gnupg
RUN docker-php-ext-install pdo pdo_mysql curl mbstring zip bcmath

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get update && apt-get install -y nodejs

RUN npm -g config set user root
RUN npm install -g @angular/cli

# PHPUnit
#RUN curl -L -O https://phar.phpunit.de/phpunit-7.0.phar
#RUN chmod +x phpunit-7.0.phar
#RUN mv phpunit-7.0.phar /usr/local/bin/phpunit

# rabbitmqadmin
#RUN curl -sS https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.3/bin/rabbitmqadmin >> rabbitmqadmin && mv rabbitmqadmin /usr/local/bin
#RUN chmod 777 /usr/local/bin/rabbitmqadmin

# Apache
ADD ./hosts/* /etc/apache2/sites-available/

RUN cd /etc/apache2/sites-available/ && a2dissite * && a2ensite vanga.conf
RUN usermod -s /bin/bash www-data
RUN mkdir /var/www/php_tmp
RUN chown -R www-data: /var/www/php_tmp

WORKDIR /var/www/sources

EXPOSE 80 8080 443 3000 9000 4200
