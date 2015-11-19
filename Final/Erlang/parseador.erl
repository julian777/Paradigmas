-module(parseador).
-export([init/0]).
-export([insert/9]).
-export([select_all/0,select_count/0,select_count_tweet/0,select_count_face/0,select_all_face/0,select_all_tweet/0]).
-export([select_patron/1]).
-export([select_post/0,select_twitter/0,select_face/0]).
-export([update/2]).
-include_lib("stdlib/include/qlc.hrl").


-record(data, {id,
		   usuario,
                   mensaje,
                   hora,
                   lugar,
                   hashtag,
                   medio,
                   tema,
                   estado}).

%Necesito, un metodo contador de todas la tuplas y un metodo que borre todas las tuplas.
%Cuando se activa Java por fuerza Erlang debe detenerse para poder hacer un conteo, no hay de otra
 
%ara twitter
%crea las tablas por defecto son tipo ordered_set
init()->
    mnesia:create_table(data,
                        [{attributes, record_info(fields, data)}]).

%metodo insertar a tabla twitter

insert(Id,Usuario,Mensaje,Hora,Lugar,Hashtag,Medio,Tema,Estado) ->
    Fun = fun() ->
         mnesia:write(
         #data{ 
         	id=Id,
			usuario = Usuario,
			mensaje = Mensaje,
			hora = Hora,
			lugar = Lugar,
			hashtag = Hashtag,
			medio = Medio,
			tema = Tema,
			estado = Estado
			})
		end,
        mnesia:transaction(Fun).

%metodo seleccionar todos los registros de la tabla twitter

select_all() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ {U,"None",Time,"","",F,T,""} || {_,_Id,U,_M,Time,_,_,F,T,[]} <- mnesia:table(data),length(T)/=0] 
        )) 
    end ).

select_all_face() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ {U,"#"++T,Time,"","","facebook",T,""} || {_,_Id,U,_M,Time,_,_,"facebook",T,[]} <- mnesia:table(data),length(T)/=0] 
        )) 
    end ).

select_all_tweet() -> 
    mnesia:transaction( 
    fun() ->
        qlc:eval( qlc:q(
            [ {U,"#"++T,Time,"","","Twitter",T,""} || {_,_Id,U,_M,Time,_,_,"Twitter",T,[]} <- mnesia:table(data),length(T)/=0] 
        )) 
    end ).

% select count

select_count() ->
    mnesia:transaction( 
    fun() ->
        L = qlc:eval( qlc:q(
            [ {U,"None",Time,"","",F,T,""} || {_,_Id,U,_M,Time,_,_,F,T,[]} <- mnesia:table(data),length(T)/=0] 
        )),
	length(L)
         
    end ).

select_count_face() ->
    mnesia:transaction( 
    fun() ->
        L = qlc:eval( qlc:q(
            [ {U,"None",Time,"","","facebook",T,""} || {_,_Id,U,_M,Time,_,_,"facebook",T,[]} <- mnesia:table(data),length(T)/=0] 
        )),
	length(L)
         
    end ).

select_count_tweet() ->
    mnesia:transaction( 
    fun() ->
        L = qlc:eval( qlc:q(
            [ {U,"None",Time,"","","Twitter",T,""} || {_,_Id,U,_M,Time,_,_,"Twitter",T,[]} <- mnesia:table(data),length(T)/=0] 
        )),
	length(L)
         
    end ).

%busca un patron, varios usos

select_patron( Word ) -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} || 
                   {F0,F1,F2,F3,F4,F5,F6,F7,F8,F9} <- 
                        mnesia:table(data),
                        (string:str(F1, Word)>0) or  
                        (string:str(F3, Word)>0)
               ] )) 
    end ).


%busca post  sin clasificar
select_post() -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {Id,Msj} || {_F0,Id,_F2,Msj,_F4,_F5,_F6,_F7,Tema,_F9} <-mnesia:table(data),length(Tema)==0] )) 
    end ).

select_twitter() -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {Id,Msj,Medio,Tema} || {_F0,Id,_F2,Msj,_F4,_F5,_F6,Medio,Tema,_F9} <-mnesia:table(data),Medio == "Twitter"] )) 
    end ).
    
select_face() -> 
    mnesia:transaction( 
    fun() ->
         qlc:eval( qlc:q(
              [ {Id,Msj,Medio,Tema} || {_F0,Id,_F2,Msj,_F4,_F5,_F6,Medio,Tema,_F9}  <-mnesia:table(data),Medio == "facebook"] )) 
    end ).

%actualiza los temas de los post
update(Id,Tema) ->
    F = fun() ->
                [E] = mnesia:read(data,Id, write),
                New = E#data{tema = Tema},
                mnesia:write(New)
        end,
    mnesia:transaction(F).



