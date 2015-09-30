# Proyecto de paradigmas

Parseador de Twitter y facebook.

## Erlang

Utilizando Erlang, se deben crear hilos que van a estar sensando y consultando los sitios
https://dev.twitter.com/ y https://developers.facebook.com/ para obtener los comunicados
ticos de esas aplicaciones, y deben de eliminar artículos y preposiciones de dichos textos.
En caso de ser necesario, sería muy agradable para futuras etapas del proyecto que busque
además hacer una corrección ortográfica (en la medida de lo posible) al texto obtenido.

Los datos se van a almacenar en mnesia, la base de datos de Erlang, provisionalmente, mien-
tras otros hilos van a enviar por socket de mnesia a Prolog los datos, quien se va a encargar
de realizar la siguiente etapa de etiquetado.
Luego, cuando ya estén cargados con los datos de prolog, se enviarán a un programa en Ja-
va para su final almacenamiento en una base de datos relacional libre (se sugiere que sea
Postgres o MySql).
En la medida de lo posible, se utilizarán los siguientes datos:
1. Texto del mensaje
2. Hora en que fue emitido
3. Lugar en que fue emitido
4. Usuario autor del mensaje
5. Hastags utilizados (puede ser más de uno)
6. Medio, si es Facebook o Twitter

## Prolog

Utilizando en Swi-Prolog el DCG 2 con expresiones regulares, se parseará el texto de los men-
sajes previamente guardados y se etiquetará con respecto a su contenido por temas. Primero
se etiquetará si el emisor emite un mensaje negativo, positivo o neutro. Luego indicará si se
trata de un mensaje relativo a la política, futbol, educación, chiste, estado de ánimo personal
o desconocido (si no calza en ninguna otra opción).
Esta clasificación se hará automáticamente con respecto a algún banco de palabras que cons-
tará con al menos 100 palabras de cada tema (pueden ser hashtags o nombres propios). Es
importante considerar que las imágenes no deben ser consideradas para ser analizadas.

## Java



