-module(client).


-export([pedir/1]).

-c(rest).

pedir(A) -> 
    E = "http://localhost:1234/?msg=",
    Aa = re:replace(A," ","_",[global,{return,list}]),
    B = E++Aa,
    R = rest:response_body(request(get,{B,[]})),
    re:replace(R,"\"","",[global,{return,list}]).


request(Method, Body) ->
    httpc:request(Method, Body, [], []).

