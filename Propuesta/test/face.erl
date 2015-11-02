-module(face).
-export([request/0]).


request()-> ssl:start(),inets:start(),{ok, {{_NewVersion, 200, _NewReasonPhrase}, _Header, Body}} =httpc:request(get, {"https://graph.facebook.com/v2.5/YashinQuesada?fields=posts{created_time,message}&access_token=819178231533496|YNWY_dIyrHZA1GVKCyz_MUI7n88", []}, [], []),Data=json:value(json:value(json:parse(Body),"posts"),"data"), parse(Data).

parse([])->[];
parse([H|T])->[format(H)]++parse(T).


format([])->{};
format([A,_B,C])->{element(2,A),element(2,C),"Facebook"};
format(_L)->{}.

%compilar json.erl
%compilar face.erl
%face:request(). retorna una lista de tuplas con la fecha,mensaje y fuente, en ese orden.


