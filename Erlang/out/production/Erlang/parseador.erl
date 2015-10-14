-module(parseador).
-export([init/0]).
-export([insert_twitter/8]).
-export([select_all_twitter/0]).
-export([select_patron_twitter/1]).
-export([insert_facebook/8]).
-export([select_all_facebook/0]).
-export([select_patron_facebook/1]).
-include_lib("stdlib/include/qlc.hrl").
-include("parseador.hrl").
-author("Julian").

%ara twitter
%crea las tablas por defecto son tipo ordered_set
init()->
    mnesia:create_table(twitter,
                        [{attributes, record_info(fields, twitter)}]),
    mnesia:create_table(facebook,
                        [{attributes, record_info(fields, facebook)}]).

%metodo insertar a tabla twitter

insert_twitter(Usuario,Mensaje,Hora,Lugar,Hashtag,Medio,Tema,Estado) ->
    Fun = fun() ->
         mnesia:write(
         #twitter{ usuario = Usuario,
                   mensaje = Mensaje,
                   hora = Hora,
                   lugar = Lugar,
                   hashtag = Hashtag,
                   medio = Medio,
                   tema = Tema,
                   estado = Estado
                 }
                             )
               end,
         mnesia:transaction(Fun).

%metodo seleccionar todos los registros de la tabla twitter

select_all_twitter() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ X || X <- mnesia:table(twitter) ] 
        )) 
    end ).

%busca un patron, varios usos

select_patron_twitter( Word ) -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} || 
                   {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} <- 
                        mnesia:table(twitter),
                        (string:str(F1, Word)>0) or  
                        (string:str(F3, Word)>0)
               ] )) 
    end ).

%area facebook

%metodo insertar a tabla facebook
insert_facebook(Usuario,Mensaje,Hora,Lugar,Hashtag,Medio,Tema,Estado) ->
    Fun = fun() ->
         mnesia:write(
         #facebook{ usuario = Usuario,
                   mensaje = Mensaje,
                   hora = Hora,
                   lugar = Lugar,
                   hashtag = Hashtag,
                   medio = Medio,
                   tema = Tema,
                   estado = Estado
                 }
                             )
               end,
         mnesia:transaction(Fun).

%metodo seleccionar todos los registros de la tabla facebook
select_all_facebook() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ X || X <- mnesia:table(facebook) ] 
        )) 
    end ).

%busca un patron, varios usos

select_patron_facebook( Word ) -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} || 
                   {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} <- 
                        mnesia:table(facebook),
                        (string:str(F1, Word)>0) or  
                        (string:str(F3, Word)>0)
               ] )) 
    end ).


