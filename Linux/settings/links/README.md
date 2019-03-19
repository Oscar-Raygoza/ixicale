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
Exec=/home/usuario/carpetaPrograma/bin/programa.sh
Icon=/home/usuario/Images/iconoPrograma
Terminal=false
Type=Application
```

Por si acaso hay dudas, voy a poner un ejemplo. Este es el archivo AndroidStudio.desktop que tengo en mi carpeta /usr/share/applications:

```
[Desktop Entry]
Name=Android Studio
Comment=IDE Android Studio
Exec=/home/javierlight/Android-Studio-IDE/bin/studio.sh
Icon=/home/usuario/Imagenes/Iconos/androidstudio.png
Terminal=false
Type=Application
```

Podéis jugar con los argumentos todo lo que queráis. Si estáis pensando en ejecutar algo como superusuario, tal vez necesitéis cambiar el valor false de Terminal por un true.
