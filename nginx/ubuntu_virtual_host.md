# Nginx Virtual Host - Ubuntu - events

## 1- Editar el archivo `/etc/hosts`

```console
sudo nano /etc/hosts
```

Agregar la siguiente linea al archivo:

```nix
127.0.0.1    dev.clever-api-events.local    # FIN
```

## 2- Crear Virtual Host

```console
sudo nano /etc/nginx/sites-available/clv-events-api
```

Usar la siguiente configuracion

```Nginx
server {
    server_name dev.clever-api-events.local;
    set $root_path '/var/www/html/clv-events-api/public';
    access_log /var/log/nginx/clever_events_api_access.log;
    error_log /var/log/nginx/clever_events_api_error.log;
    error_log /var/log/nginx/clever_events_api_error.log notice;
    error_log /var/log/nginx/clever_events_api_error.log info;
    error_log /var/log/nginx/clever_events_api_error.log error;
    root $root_path;

    index index.php index.html;

    try_files $uri $uri/ @rewrite;

    location @rewrite {
        rewrite ^/(.*)$ /index.php?_url=/$1;
        if ($request_method = OPTIONS ) {
            add_header Access-Control-Allow-Origin "*";
            add_header Access-Control-Allow-Methods "GET,PUT, POST, PATCH";
            add_header Access-Control-Allow-Headers "Authorization";
            return 200;
        }
    }

    location ~ \.php$ {
        include /etc/nginx/fastcgi_params;
        # fastcgi_pass  127.0.0.1:9000;
        fastcgi_pass  unix:/var/run/php/php7.2-fpm.sock;
        #fastcgi_index index.php;
        fastcgi_param  HTTP_AUTHORIZATION $http_authorization;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~* ^/(css|img|js|flv|swf|download)/(.+)$ {
        root $root_path;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

## 3- Crear enlace simbolico

```console
sudo ln -s /etc/nginx/sites-available/clv-events-api /etc/nginx/sites-enabled/
```

## 4- Reiniciar el servidor

```console
sudo systemctl restart nginx
sudo nginx -t
sudo systemctl status nginx
```

## 5- Ir al proyecto e instalar composer

```console
cd /var/www/html/clv-events-api
composer install --ignore-platform-reqs
```

### Verificar conexión

> Url: **http://dev.clever-api-events.local/**
