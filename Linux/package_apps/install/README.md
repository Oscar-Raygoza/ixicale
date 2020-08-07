<h1 id="index-page">Paquetes para desarrollo</h1>
Ayuda para instalar los diferentes software para permitir el desarrollo dentro de CEDIS

1. [Instalar git](#git-install)
1. [Crear la llave SSH](#ssh-create)
1. [Instalacion PHP7.2 por ppa](#PHP72-install)
1. [Instalar NGINX](#NGINX-install)
1. [Instalar Composer](#Composer-install)
1. [Instalar DBeaver](#DBeaver-install)
1. [Instalar node & npm por curl](#nodejs-install)
1. [Crear carpeta tmp_repos](#tmp_repos-Crear)
1. [Instalar cphalcon 3.4.x por repositorio](#phalcon-install)
1. [Agregar phalcon a php7.2-fpm](#phalcon-php72)
1. [Palo Alto - GlobalProtect](#NGINX-install)

<details>
<summary>
<b >Instalar git</b>
<a id="git-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo apt install git
git config --global user.email ixicaleescalante@gmail.com
git config --global user.name ixicale
```

</p>
</details>

<details>
<summary>
<b >Crear la llave SSH</b>
<a id="ssh-create" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
ssh-keygen
cat ~/.ssh/id_rsa.pub # agregar a github en configuraciones
```

</p>
</details>

<details>
<summary>
<b >Instalacion PHP7.2 por ppa</b>
<a id="PHP72-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install php7.2-dev php7.2-curl php7.2-mbstring php7.2-json php7.2-fpm
ss -pl | grep php
sudo systemctl status php7.2-fpm
sudo chown -R $USER:$USER /var/www/html
echo -e "<?php\nphpinfo();\n" > /var/www/html/info.php
```

try to open php info: http://localhost/info.php

</p>
</details>

<details>
<summary>
<b >Instalar NGINX</b>
<a id="NGINX-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo apt install nginx
sudo gedit /etc/nginx/nginx.conf
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx_backup_initial.conf
sudo gedit /etc/nginx/nginx.conf # descomentar 'server_tokens off' # descomentar ese contenido
sudo gedit /etc/nginx/sites-available/default # configuracion php7.2
```

```nix
location ~ \.php$ {
   include snippets/fastcgi-php.conf;

   # With php-fpm (or other unix sockets):
   fastcgi_pass unix:/var/run/php/php7.2-fpm.sock; # <- cambiar a php version usada
   # With php-cgi (or other tcp sockets):
   #fastcgi_pass 127.0.0.1:9000;
}
```

```sh
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ # Crear enlace en caso de que no exista (debe existir)
sudo systemctl restart nginx
sudo nginx -t
sudo chown -R $USER:$USER /var/www/html
sudo ufw app list # verificar que exista 'Nginx Full' | 'Nginx HTTP' | 'Nginx HTTPS'
```

</p>
</details>

<details>
<summary>
<b >Instalar Composer</b>
<a id="Composer-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo apt install composer
```

</p>
</details>

<details>
<summary>
<b >Instalar DBeaver</b>
<a id="DBeaver-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo apt -y install openjdk-11-jdk openjdk-11-jre
java -version
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt -y install dbeaver-ce
apt policy dbeaver-ce
```

</p>
</details>

<details>
<summary>
<b >Instalar node & npm por curl</b>
<a id="nodejs-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo apt update; sudo apt -y upgrade;
sudo apt-get -y install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs
echo -e "node\t-> $(node --version)\nnpm\t-> $(npm --version)"
```

</p>
</details>

<details>
<summary>
<b >Crear carpeta tmp_repos</b>
<a id="tmp_repos-Crear" href="#index-page">[↑]</a>
</summary>
<p>

```sh
mkdir ~/.tmp_repos
cd ~/.tmp_repos
```

</p>
</details>

<details>
<summary>
<b >Instalar cphalcon 3.4.x por repositorio</b>
<a id="phalcon-install" href="#index-page">[↑]</a>
</summary>
<p>

```sh
cd ~/.tmp_repos
sudo apt update; sudo apt -y upgrade;
git clone https://github.com/phalcon/cphalcon.git
cd cphalcon
git checkout 3.4.x
cd build
sudo apt install re2c
sudo ./install --phpize /usr/bin/phpize7.2 --php-config /usr/bin/php-config7.2
```

</p>
</details>

<details>
<summary>
<b >Agregar phalcon a php7.2-fpm</b>
<a id="phalcon-php72" href="#index-page">[↑]</a>
</summary>
<p>

```sh
sudo gedit /etc/php/7.2/fpm/conf.d/30-phalcon.ini # Agregar 'extension=phalcon.so'
echo -e "<?php\nphpinfo();\n" > /var/www/html/info.php
sudo systemctl restart php7.2-fpm.service
sudo systemctl status php7.2-fpm.service
```

</p>
</details>

<details>
<summary>
<b >Palo Alto - GlobalProtect</b>
<a id="NGINX-install" href="#index-page">[↑]</a>
</summary>
<p>

Descargar (Palace2020) https://nextcloud.palaceresorts.com/s/ASE7XNyPk7QLpBX

Descomprimir todos los `tgz` (3, verificar nombres `GlobalProtect_*`) y aplicar make con sudo

```sh
cd ~/Descargas/PanGPLinux-5.1.1-c17/GlobalProtect_tar-5.1.1.0-17;sudo make;
cd ~/Descargas/PanGPLinux-5.1.1-c17/GlobalProtect_tar_arm-5.1.1.0-17;sudo make;
cd ~/Descargas/PanGPLinux-5.1.1-c17/GlobalProtect_UI_tar-5.1.1.0-17;sudo make;
```

</p>
</details>
