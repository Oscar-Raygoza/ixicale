# Crear Virtual Host

```
sudo nano /etc/nginx/sites-available/clv-events-api
```

Usar/adaptar la siguiente configuracion

```conf
server {

    server_name dev.clever-api-benefit.local;
    set $root_path '/srv/http/clv-benefit-api/public';
    access_log /var/log/nginx/clv_benefit_api_access.log;
    error_log /var/log/nginx/clv_benefit_api_error.log;
    error_log /var/log/nginx/clv_benefit_api_error.log notice;
    error_log /var/log/nginx/clv_benefit_api_error.log info;
    error_log /var/log/nginx/clv_benefit_api_error.log error;
    root $root_path;

    index index.php index.html;
    try_files $uri $uri/ @rewrite;

    location @rewrite {
	add_header X-debug-message "SOY UN MENSAJE PARA DEBUG :-)" always;
        rewrite ^/(.*)$ /index.php?_url=/$1;
        if ($request_method = "OPTIONS" ) {
            add_header Access-Control-Allow-Origin "*";
            add_header Access-Control-Allow-Methods "GET,PUT, POST, PATCH";
            add_header Access-Control-Allow-Headers "Authorization";
	    return 200;
        }
    }

    location ~ \.php$ {
	include fastcgi.conf;
	fastcgi_pass unix:/run/php-fpm/php-fpm.sock;
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
