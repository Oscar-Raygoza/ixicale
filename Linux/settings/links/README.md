# Accesos directos para aplicaciones


Lo primero que vamos a hacer es abrir gedit para crear un nuevo archivo de tipo .desktop en la carpeta home/usr/share/applications (obligatorio utilizar sudo, necesitamos super permiso).

```
sudo gedit /usr/share/applications/nombreprograma.desktop
```


A continuación, editaremos el archivo que estamos creando. Debemos añadir las siguientes líneas:

```
[Desktop Entry]
Name=Nombre del programa
Comment=Comentario sobre el programa
Exec=/$HOME/carpetaPrograma/bin/programa.sh
Icon=/$HOME/Imagenes/iconoPrograma
Terminal=false
Type=Application
```

Por si acaso hay dudas, voy a poner un ejemplo. Este es el archivo AndroidStudio.desktop que tengo en mi carpeta /usr/share/applications:

```
[Desktop Entry]
Name=Android Studio
Comment=IDE Android Studio
Exec=/$HOME/Android-Studio-IDE/bin/studio.sh
Icon=/$HOME/Imagenes/Iconos/androidstudio.png
Terminal=false
Type=Application
```

Podéis jugar con los argumentos todo lo que queráis. Si estáis pensando en ejecutar algo como superusuario, tal vez necesitéis cambiar el valor false de Terminal por un true.

Y con esto, ya podemos abrir nuestro programa desde el dash de Ubuntu, simplemente buscando. Coincidiréis conmigo en que pulsar la tecla Super y escribir un par de letras es mucho más cómodo que abrir la terminal e introducir algunas líneas cada vez que queramos ejecutar el programa.
