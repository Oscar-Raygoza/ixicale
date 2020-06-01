# basic to install
# create new folder and run

- mkdir $HOME/.my_temp_downloads
- cd $HOME/.my_temp_downloads
- sudo apt update
- sudo apt upgrade

## install terminator

- sudo apt install terminator

## install git

- sudo apt update
- sudo apt install git
- sudo apt install curl

## install nginx

- sudo apt update
- sudo apt install nginx
- sudo ufw app list
- sudo ufw allow 'Nginx HTTP'
- sudo ufw status
- sudo systemctl status nginx

## install PHP 7.4 and link nginx

- sudo apt install php-fpm php-cli php-curl php-mysql php-curl php-gd php-mbstring - php-pear -y
- cd /etc/php/7.4/fpm/
- sudo apt install php7.4-dev
- sudo gedit php.ini # change 'cgi.fix_pathinfo = 0' and save, then close
- sudo systemctl start php7.4-fpm
- sudo systemctl enable php7.4-fpm
- sudo systemctl status php7.4-fpm
- ss -pl | grep php
- cd /etc/nginx/
- sudo gedit nginx.conf # Uncomment 'server_tokens off;' and save, then close
- sudo gedit sites-available/default #change below and save, then close

```shell
location ~ \.php$ {
            include snippets/fastcgi-php.conf;
    #
    #       # With php-fpm (or other unix sockets):
            fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    #       # With php-cgi (or other tcp sockets):
    #       fastcgi_pass 127.2.0.1:9000;
}
```


- sudo nginx -t
- sudo systemctl restart nginx
- sudo gedit /var/www/html/info.php

```php
$<?php
$phpinfo();
$?>
```
- sudo chown -R $USER:$USER .


## install node12.x & npm 

- cd $HOME/.my_temp_downloads
- sudo apt update
- curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
- sudo apt install nodejs
- node --version
- npm --version

## install phalcon

- git clone https://github.com/phalcon/cphalcon.git
- cd cphalcon
- git checkout 3.4.x
- cd build
- sudo ./install
- sudo gedit /etc/php/7.4/fpm/php.ini # add extension 'extension=phalcon.so' save and - then close


## install composer

- cd $HOME/.my_temp_downloads
- sudo apt update
- sudo apt upgrade
- sudo apt install composer



## Generando clave SSH
- cd ~/.ssh # create if it does not exists
- ls
- ssh-keygen #only enter
- cat ~/.ssh/id_rsa.pub

## install dbeaver
- cd $HOME/.my_temp_downloads

### install java
- sudo apt -y  install openjdk-11-jdk openjdk-11-jre
- java -version

### Add Debian repository and Install DBeaver CE
- wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
- echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

- sudo apt update
- sudo apt -y  install dbeaver-ce
- apt policy  dbeaver-ce 

