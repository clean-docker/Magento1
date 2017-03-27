![Magento 1](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 1 Docker to Development

### Apache 2 + PHP 5.5 + MariaDB + Magerun + DevAlias

[![Build Status](https://travis-ci.org/clean-docker/PHP-Apache.svg?branch=master)](https://travis-ci.org/clean-docker/PHP-Apache)
[![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/php-apache.svg)](https://microbadger.com/images/rafaelcgstz/php-apache)

This cluster ready docker-compose infrastructure.

#### Copy and run

```
git clone https://github.com/clean-docker/PHP-Apache.git m1-docker &&
cd m1-docker &&
docker-compose up -d ;
docker ps
```

#### Projects folder

There is a folder in this project calling **./magento**, this folder is the folder **/var/www/html/** inside your container, is the folder that you will work on.

#### Access the container Docker

To access in you browser you can use http://localhost ( I recommend change your /etc/hosts ).

```
docker exec -ti YOUR_APACHE_CONTAINER_NAME bash
```

#### Access the MySQL

In your terminal out of the container run this command.

```
mysql -u root -proot -h 0.0.0.0 -P 3300
```

To know what is the IP to use in the Magento installation (Database Server Host), you can use this command out the container or just use **db** instead of the IP.

```
docker inspect YOUR_DB_CONTAINER_NAME | grep IPAddress
```

#### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
