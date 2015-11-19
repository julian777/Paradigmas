-module(json).
-export([parse/1,val/2,parseSmart/1]).

parse(L)->
	{V,_R}=
	value(L), V.

parseSmart(L)->{V,_R}=value(ee(L)), V.

recString([34|T],S)->{[34|S]++[34],T};
recString([H|T],S)->recString(T,S++[H]).

ee([])->[];
ee([32|T])->ee(T);
ee([92,_|T])->ee(T);
ee([10|T])->ee(T);
ee([34|T])->{S, R}=recString(T,[]),S++ee(R);
ee([H|T])->[H|ee(T)].


value([91|T])->lista(T);
value([34|T])->key(T,[]);
value([123|T])->object(T);
value([X|T]) when X>47, X<59 ->numero([X|T]);
value([102,97,108,115,101|T])->{false,T};
value([116,114,117,101|T])->{true,T};
value([110,117,108,108|T])->{null,T};
value([45|T])->{N,R}=numero(T),{[45|N],R}.
%yo .

numero([])->[];
numero([46|T])->numero(T);
numero([H|T]) when H>47, H<59->{N,R}=numero(T),{[H-48|N],R};
numero(X)->{[],X}.

object([125|T])->{[],T};
object([44|T])->object(T);
object([_|L])->{K,[_|X]}=key(L,[]),{V,T2}=value(X),{V2,R2}=object(T2),{[{K,V}]++V2,R2}.

lista([93|T])->{[],T};
lista([44|T])->lista(T);
lista(X)->{V,R}=value(X),{V2,R2}=lista(R),{[V]++V2,R2}.

key([34|T],K)->{K,T};
key([92,34|T],K)->key(T,K++[34]);
key([H|T],K)->key(T,K++[H]).


val([[V]|_],_K)->V;
val([{K,V}|_],K)->V;
val([],_)->null;
val([_|T],K)->val(T,K).











