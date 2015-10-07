# Instrucciones de uso GIT

## Enviar cambios
``` git
1. git add . 
2. git commit -m "Mensaje de commit"
3. git push
```
> Paso 1 es opcional, solo usar si se añaden archivos

## Actualizar local

``` git
1. git fetch
2. git merge origin/master
```

## En caso de problemas de conflicto
``` git
1. git reset --hard HEAD
2. git pull
```
> Se pierden los cambios locales
