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

