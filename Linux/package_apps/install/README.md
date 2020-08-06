# Installation guide

### Git install
```sh
sudo apt update; sudo apt upgrade -s;
sudo apt install git
git config --global user.email ixicaleescalante@gmail.com
git config --global user.name ixicale

```


### PHP 7.2 install
```sh
sudo apt update; sudo apt upgrade -s;

sudo apt install php7.2-gmp php7.2-imap php7.2-interbase php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-pgsql php7.2-phpdbg php7.2-pspell php7.2-readline php7.2-recode php7.2-soap php7.2-sqlite3 php7.2-sybase php7.2-tidy php7.2-xml ph
sudo apt install php7.2 php7.2-bcmath php7.2-bz2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dba php7.2-dev php7.2-enchant php7.2-fpm php7.2-gd
sudo gedit /var/www/html/info.php
sudo chown -R $USER:$USER /var/www/html
ss -pl | grep php
sudo systemctl status php7.2-fpm
```




### nginx install
```sh
sudo apt update; sudo apt upgrade -s;
sudo apt install nginx
sudo gedit /etc/nginx/nginx.conf

sudo gedit /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo systemctl restart nginx
sudo nginx -t
sudo chown -R $USER:$USER /var/www/html
sudo ufw app list
```


### composer install
```sh
sudo apt update; sudo apt upgrade -s;
sudo apt install composer
composer install --ignore-platform-reqs
```


### dbeaver install
```sh
sudo apt update; sudo apt upgrade -s;
sudo apt -y install openjdk-11-jdk openjdk-11-jre
java -version
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt -y install dbeaver-ce
apt policy dbeaver-ce
```


### phalcon install
```sh
sudo apt update; sudo apt upgrade -s;
cd ~/.my_temp_downloads
git clone git@github.com:phalcon/cphalcon.git
cd cphalcon/build
sudo ./install --phpize /usr/bin/phpize7.2  --php-config /usr/bin/php-config7.2
make test
sudo cat /etc/php/7.2/mods-available/xsl.ini > /etc/php/7.2/mods-available/phalcon.ini
sudo nano /etc/php/7.2/mods-available/phalcon.ini

sudo ln -s /etc/php/7.2/mods-available/phalcon.ini /etc/php/7.2/fpm/conf.d/20-phalcon.ini
sudo systemctl status php7.2-fpm.service
sudo systemctl restart php7.2-fpm.service
```


### Global Protect install
```sh
# descomprimir en una carpeta y abrir la carpeta
tar -zxf PanGPLinux-5.1.1-c17.tgz

# descomprimir en una carpeta, abrir la carpeta y aplicar make
tar -zxf GlobalProtect_tar-5.1.1.0-17.tgz;
cd GlobalProtect_tar-5.1.1.0-17; sudo make; cd ..

# descomprimir en una carpeta, abrir la carpeta y aplicar make
tar -zxf GlobalProtect_tar_arm-5.1.1.0-17.tgz
cd GlobalProtect_tar_arm-5.1.1.0-17; sudo make; cd ..

# descomprimir en una carpeta, abrir la carpeta y aplicar make
tar -zxf GlobalProtect_UI_tar-5.1.1.0-17.tgz
cd GlobalProtect_UI_tar-5.1.1.0-17; sudo make; cd ..
```
