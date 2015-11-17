-author("Julian").
%Declaracion de atributos, se deben llamar luego de c(parseador). con el comando:
%rr(parseador). desde el shell de erlang

-record(twitter, {usuario,
                   mensaje,
                   hora,
                   lugar,
                   hashtag,
                   medio,
                   tema,
                   estado}).

-record(facebook, {id,usuario,
                   mensaje,
                   hora,
                   lugar,
                   hashtag,
                   medio,
                   tema,
                   estado}).
