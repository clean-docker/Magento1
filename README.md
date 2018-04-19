![Magento 1](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 1 Docker to Development

### Apache 2 + PHP 5.5 + MariaDB + Magerun + OPCache

[![Build Status](https://travis-ci.org/clean-docker/Magento1.svg?branch=master)](https://travis-ci.org/clean-docker/Magento1)
[![Docker Build](https://img.shields.io/docker/build/rafaelcgstz/magento1.svg)](https://hub.docker.com/r/rafaelcgstz/magento1/)
[![Docker Pulls](https://img.shields.io/docker/pulls/rafaelcgstz/magento1.svg)](https://hub.docker.com/r/rafaelcgstz/magento1/)

This cluster ready docker-compose infrastructure.


### Requirements

**MacOS:**

Install [Docker](https://docs.docker.com/docker-for-mac/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-OSX).

**Windows:**

Install [Docker](https://docs.docker.com/docker-for-windows/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-Windows).

**Linux:**

Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) and [Docker-compose](https://docs.docker.com/compose/install/#install-compose).

### How to use

Execute in your terminal, change the *MYMAGENTO* to use the name of your project:

```
curl -s https://raw.githubusercontent.com/clean-docker/PHP-Apache/master/init | bash -s MYMAGENTO clone
```

If you want install the Magento, use like that:

```
cd MYMAGENTO
./shell
```

### Panels

Enjoy your new panels!

**Web server:** http://localhost/

**PHPMyAdmin:** http://localhost:8080

**Local emails:** http://localhost:8025

### Features commands

| Commands  | Description  | Options & Examples |
|---|---|---|
| `./init`  | If you didn't use the CURL setup command above, please use this command changing the name of the project.  | `./init MYMAGENTO` |
| `./start`  | If you continuing not using the CURL you can start your container manually  | |
| `./stop`  | Stop your project containers  | |
| `./kill`  | Stop your project containers and remove named volumes  | |
| `./shell`  | Access your container  | `./shell root` | |
| `./magento`  | Use the power of the Magento CLI  | |
| `./n98`  | Use the Magerun commands as you want | |
| `./xdebug`  |  Enable / Disable the XDebug | |

### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
