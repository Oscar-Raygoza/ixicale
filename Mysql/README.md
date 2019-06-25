# Configuracion común MySQL

## Uninstall MySQL completely

Remove all files related to MySQL

```bash
sudo apt-get purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
```
Then upgrade my distribution

```bash
sudo apt-get dist-upgrade
```

## Como instalar  MySQL

### Instalar MySQL
Únicamente la última versión de MySQL se incluye en el repositorio de paquete APT de forma predeterminada en Ubuntu 18.04. Al momento de escribir esto, esa sería la versión MySQL 5.7.

Para instalarla, actualice el índice del paquete en su servidor con apt:

```bash
sudo apt update
```
Luego, instale el paquete predeterminado:

```bash
sudo apt install mysql-server
```
### Configurar MySQL
Para las instalaciones recientes, querrá ejecutar el script de seguridad que viene incluido. Esto cambia algunas de las opciones predeterminadas menos seguras para cosas como inicios de sesión root remotos y usuarios de ejemplo. Para las versiones antiguas de MySQL, también deberá inicializar el directorio de datos manualmente, pero ahora esto se hace automáticamente.

Ejecute el script de seguridad
```bash
sudo mysql_secure_installation
```

### Ajustar la autenticación y los privilegios del usuario

Para los sistemas Ubuntu que estén usando MySQL 5.7 (y las versiones posteriores), el usuario root de MySQL está configurado, de forma predeterminada, para autenticarse usando el plugin auth_socket en vez de una contraseña. En muchos casos, esto permite que la seguridad y usabilidad sea mayor pero también puede complicar las cosas cuando deba permitir que un programa externo (tal como phpMyAdmin) tenga acceso al usuario.

Deberá cambiar su método de autenticación de auth_socket a mysql_native_password para usar una contraseña para conectarse a MySQL como root. Para hacerlo, abra la indicación de MySQL desde su terminal:

```bash
sudo mysql
```
Posteriormente, consulte cuál método de autenticación usa cada una de sus cuentas de usuario de MySQL usando el siguiente comando:
```sql
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

```sql
+------------------+-------------------------------------------+-----------------------+-----------+
| user             | authentication_string                     | plugin                | host      |
+------------------+-------------------------------------------+-----------------------+-----------+
| root             |                                           | auth_socket           | localhost |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| debian-sys-maint | *CC744277A401A7D25BE1CA89AFF17BF607F876FF | mysql_native_password | localhost |
+------------------+-------------------------------------------+-----------------------+-----------+
4 rows in set (0.00 sec)
```

En este ejemplo, puede ver que el usuario root verdaderamente se autentica usando el plugin auth_socket. Para configurar la cuenta root para autenticarse usando una contraseña, ejecute el siguiente comando ALTER USER. Asegúrese de cambiar password (contraseña) a una contraseña segura de su elección y sepa que este comando cambiará la contraseña de root que estableció en el Paso 2:


```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
Luego, ejecute **FLUSH PRIVILEGES** (purgar privilegios), lo que le dice al servidor que vuelva a cargar las tablas grant e implemente sus nuevos cambios:

```sql
FLUSH PRIVILEGES;
```



Vuelva a verificar los métodos de autenticación que usa cada uno de sus usuarios para confirmar que **root** ya no se autentica usando el plugin *auth_socket*:

```sql
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

```sql
+------------------+-------------------------------------------+-----------------------+-----------+
| user             | authentication_string                     | plugin                | host      |
+------------------+-------------------------------------------+-----------------------+-----------+
| root             | *3636DACC8616D997782ADD0839F92C1571D6D78F | mysql_native_password | localhost |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| debian-sys-maint | *CC744277A401A7D25BE1CA89AFF17BF607F876FF | mysql_native_password | localhost |
+------------------+-------------------------------------------+-----------------------+-----------+
4 rows in set (0.00 sec)
```
En este resultado de ejemplo, puede ver que, ahora, el usuario root de MySQL se autentica usando una contraseña. Una vez que confirme esto en su propio servidor, puede salir del shell de MySQL:


```sql
exit
```

### Probar MySQL

Independientemente de cómo lo instaló, MySQL debería haber empezado a ejecutarse automáticamente. Para probar esto, verifique su estado.

```bash
systemctl status mysql.service
```



































---
