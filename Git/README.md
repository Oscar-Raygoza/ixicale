# Comandos Basicos y configuraciones para el control de git

## subir cambios en la rama actual

```
git pull
git commit -am "cambio x"
git push
```


## Revisar cambios

```
git status
```


## Hacer Merge con ramas

```
git checkout pre.dev.2018.12.05.1 
git pull
git checkout ixicale
git branch
git merge pre.dev.2018.12.05.1
git commit -am "Merge branch 'ixicale' into 'pre.dev'"
git pull
git push
git checkout pre.dev.2018.12.05.1 
git merge ixicale 
git commit -am "Merge branch 'pre.dev' into 'ixicale'"
git pull
git push
git checkout ixicale
```


## Agregar rama local del repositorio con la rama actual

```
git checkout pre.dev.2018.11.28-01 
git checkout -b ixicale
```

## Publicar rama a repositorio 

```
git push -u origin ixicale
```

## Borrar la rama 

```
git branch -D ixicale
```

## Copiar rama

```
git push origin :ixicale
```


## Publicar por primera vez Git
```
git remote add origin <ssh>
git push -u origin master
```
--- 

## Merge entre 2 repositorios mediante ramas
1. **Mover al repositorio**

_Dirigirse al repositorio local_

> cd _RUTA/LOCALIZACION/MI_REPOSITORIO_EJEMPLO_


_Clonar el repositorio donde obtendrá ambos cambios (opcional)_

> git clone <SHH>



2. **Abrir url del repositorio a fusionar**

Copiar enlace shh _(Ejemplo: git@github.com:USUARIO/MI_REPOSITORIO_EJEMPLO.git)_


3. **Fusionar repositorios**
```
¡ADVERTENCIA!
Toda palabra en mayuscula debe ser reemplazada según el caso. 

1. Verificar que se encuentre posicionado dentro de la carpeta clonada 
  (o del repositorio nuevo) antes de ingresar los comandos

2. Al fusionar, puede generar conflictos si extiste algun archivo 
  similar (como el caso de archivos ".gitignore").

3. Se recomienda estar muy al pendiente de los cambios para no perder información. 
  Es responsabilidad del usuario el realizar estos pasos

4. Se recomienda estar posicionado en la rama donde quiera realizar los cambios, 
  en este ejemplo no se hace movimiento de rama por que se trabajó de forma informativa
  desde la rama master.
```

_Bajar historial del repositorio externo_

> git remote add -f ETIQUETA_IDENTIFICACION ENLACE_SSH


_Fusion del repositorio externo con el actual_

> git merge --allow-unrelated-histories ETIQUETA_IDENTIFICACION/RAMA



4. **Finalizar**
```
¡ADVERTENCIA!

Se recomienda repetir el paso 2 (en caso de fusionar más repositorios) antes de continuar.
```

*Enlazar nuestro repositorio en git*

> git remote add origin git@github.com:USUARIO/MI_REPOSITORIO_FUSION.git

```
En caso de obtener el error: 
"fatal: remote origin already exists."

Fue por que la carpeta ha sido sincronizada con algn enlace. Continuar con el siguiente paso.
```

*Publicar nuestros cambios en el repositorio git*

> git push -u origin master


