-module(client).
-export([pedir/1]).


pedir([]) ->
    inets:start(),
    ssl:start(), 
    E = "http://localhost:1234/?msg=",
    Aa = re:replace("N/A"," ","_",[global,{return,list}]),
    B = E++Aa,
    R = rest:response_body(request(get,{B,[]})),
    re:replace(R,"\"","",[global,{return,list}]);
pedir(A) ->
    inets:start(),
    ssl:start(), 
    E = "http://localhost:1234/?msg=_",
    Aa = re:replace(A," ","_",[global,{return,list}]),
    B = E++Aa,
    R = rest:response_body(request(get,{B,[]})),
    re:replace(R,"\"","",[global,{return,list}]).


request(Method, Body) ->
    httpc:request(Method, Body, [], []).

