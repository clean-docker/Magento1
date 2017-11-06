![Magento 1](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 1 Docker to Development

### Apache 2 + PHP 5.5 + MariaDB + Magerun + OPCache

[![Build Status](https://travis-ci.org/clean-docker/PHP-Apache.svg?branch=master)](https://travis-ci.org/clean-docker/PHP-Apache)
[![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/php-apache.svg)](https://microbadger.com/images/rafaelcgstz/php-apache)

This cluster ready docker-compose infrastructure.

### MacOS / Linux Requirements

**MacOS (Docker, Docker-compose and Docker-sync)**

```
  brew tap caskroom/cask
  brew cask install docker
  brew install docker-compose
  sudo gem install docker-sync
```

**Linux (Docker, Docker-compose)**

Use this [official Docker tutorial](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).

### How to use

Execute in your terminal, change the *MYMAGENTO* to use the name of your project:

```
curl -s https://raw.githubusercontent.com/clean-docker/PHP-Apache/master/init | bash -s MYMAGENTO clone
```

If you want install the Magento, use like that:

```
cd MYMAGENTO
./shell
rm index.php
install-magento
```

You can specify the version that want install (e.g. `install-magento 1.9.3.4`).

### Panels

Enjoy your new panels!

**Web server:** http://localhost/

**PHPMyAdmin:** http://localhost:8080

**Local emails:** http://localhost:8025

### Features commands

| Commands  | Description  | Options & Examples |
|---|---|---|
| `./init`  | If you didn't use the CURL setup command above, please use this command changing the name of the project.  | `./init MYMAGENTO2` |
| `./start`  | If you continuing not using the CURL you can start your container manually  | |
| `./stop`  | Stop your project containers  | |
| `./shell`  | Access your container  | `./shell root` | |
| `./magento`  | Use the power of the Magento CLI  | |
| `./n98`  | Use the Magerun commands as you want | |
| `./xdebug`  |  Enable / Disable the XDebug | |

### License

MIT © 2017 [Rafael Corrêa Gomes](https://github.com/rafaelstz/) and contributors.
