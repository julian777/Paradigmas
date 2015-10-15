-- TWITTERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

-- Punto No1 grafica

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `hora_cant_tema_tweet`
()
BEGIN 
SELECT 
  CONCAT( HOUR(hora), ' to ', CONCAT( HOUR(hora), ':59:59' ) ) as Horas,
  COUNT(tema), tema 
FROM 
  Twitter
GROUP BY 
  DATE(hora), 
  HOUR(hora),
  tema;
END$$ 
DELIMITER ;

call hora_cant_tema_tweet();

-- punto No2 grafica pastel

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `proporcion_pastel`
()
BEGIN 

SELECT COUNT(tema), tema FROM Twitter GROUP BY tema;

END$$ 
DELIMITER ;

call proporcion_pastel();

-- Punto No3 grafica de barras

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `frecuencia_barras`
()
BEGIN 

SELECT HOUR(hora), COUNT(*) Cantidad_Mensajes FROM Twitter
GROUP BY HOUR(hora);

END$$ 
DELIMITER ;

call frecuencia_barras();

-- Punto No4 cantidad de mensajes con hastag y sin hastag (para relacionarlos, decir
-- hay mas con hastag que sin hastag, o asi, reflejarlo en una grafica)

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Con_o_Sin_Hastag`
()
BEGIN 

select COUNT(hastag) sin_Hastag,(select COUNT(hastag) from Twitter where hastag = 1) con_Hastag
from Twitter where hastag = 0;

END$$ 
DELIMITER ;

call Con_o_Sin_Hastag();

-- Punto No5.0 obtener todos los mensajes cuyo campo hastag sea = 1 para analizar frecuencias
-- devuelve dos valores, el hastag y la cantidad que se repite, esto en orde desc
DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mensajes_con_Hastag_Twitter`
()
BEGIN 

SELECT mensaje, COUNT(mensaje) FROM Twitter where hastag = 1 GROUP BY mensaje order by COUNT(mensaje) desc;

END$$ 
DELIMITER ;

call Mensajes_con_Hastag_Twitter();

-- Punto No5 Devuelve un string con usuario y su cantidad de mensajes
-- ordena a los usuarios con mayor cantidad de mensajes arriba, de forma que
-- luego se pueden tomar los primeros 5 o 10 y graficarlos

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuario_Cant_Tweets`
()
BEGIN 

SELECT usuario, COUNT(*) Cantidad_Mensajes FROM Twitter
GROUP BY usuario
ORDER BY Cantidad_Mensajes desc;

END$$ 
DELIMITER ;

call Usuario_Cant_Tweets();

-- No 6 densidad por hora, devuelve, hora y cantidad de mensajes y el medio

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Densidad_Hora_Cant_Medio`
()
BEGIN 

SELECT HOUR(hora), COUNT(*) Cantidad_Mensajes, medio Medio FROM Twitter
GROUP BY HOUR(hora);

END$$ 
DELIMITER ;

call Densidad_Hora_Cant_Medio();

-- FACEBOOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK

-- Punto No1 grafica

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `hora_cant_tema_Post`
()
BEGIN 
SELECT 
  CONCAT( HOUR(hora), ' to ', CONCAT( HOUR(hora), ':59:59' ) ) as Horas,
  COUNT(tema), tema 
FROM 
  Facebook
GROUP BY 
  DATE(hora), 
  HOUR(hora),
  tema;
END$$ 
DELIMITER ;

call hora_cant_tema_Post();

-- punto No2 grafica pastel

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `proporcion_pastel_facebook`
()
BEGIN 

SELECT COUNT(tema), tema FROM Facebook GROUP BY tema;

END$$ 
DELIMITER ;

call proporcion_pastel_facebook();

-- Punto No3 grafica de barras

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `frecuencia_barras_facebook`
()
BEGIN 

SELECT HOUR(hora), COUNT(*) Cantidad_Mensajes FROM Facebook
GROUP BY HOUR(hora);

END$$ 
DELIMITER ;

call frecuencia_barras_facebook();

-- Punto No4 cantidad de mensajes con hastag y sin hastag (para relacionarlos, decir
-- hay mas con hastag que sin hastag, o asi, reflejarlo en una grafica)

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Con_o_Sin_Hastag_facebook`
()
BEGIN 

select COUNT(hastag) sin_Hastag,(select COUNT(hastag) from Facebook where hastag = 1) con_Hastag
from Facebook where hastag = 0;

END$$ 
DELIMITER ;

call Con_o_Sin_Hastag_facebook();

-- Punto No5.0 obtener todos los mensajes cuyo campo hastag sea = 1 para analizar frecuencias
-- devuelve cuantas veces se repite este hastag en orde de mayor a menor
DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Mensajes_con_Hastag_facebook`
()
BEGIN 

SELECT mensaje, COUNT(mensaje) FROM Facebook where hastag = 1 GROUP BY mensaje order by COUNT(mensaje) desc;

END$$ 
DELIMITER ;

call Mensajes_con_Hastag_facebook();

-- Punto No5 Devuelve un string con usuario y su cantidad de mensajes
-- ordena a los usuarios con mayor cantidad de mensajes arriba, de forma que
-- luego se pueden tomar los primeros 5 o 10 y graficarlos

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuario_Cant_Post`
()
BEGIN 

SELECT usuario, COUNT(*) Cantidad_Mensajes FROM Facebook
GROUP BY usuario
ORDER BY Cantidad_Mensajes desc;

END$$ 
DELIMITER ;

call Usuario_Cant_Post();

-- No 6 densidad por hora, devuelve, hora y cantidad de mensajes y el medio

DELIMITER $$ 
CREATE DEFINER=`root`@`localhost` PROCEDURE `Densidad_Hora_Cant_Medio_Facebook`
()
BEGIN 

SELECT HOUR(hora), COUNT(*) Cantidad_Mensajes, medio Medio FROM Facebook
GROUP BY HOUR(hora);

END$$ 
DELIMITER ;

call Densidad_Hora_Cant_Medio_Facebook();
