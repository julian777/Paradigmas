%%%-------------------------------------------------------------------
%%% @author mario
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Sep 2015 10:55 PM
%%%-------------------------------------------------------------------
-module(rest).
-author("mario").

%% API
-export([post/3]).
-export([get/1]).
-export([response_body/1]).
-export([getjson/1]).

get(URL) -> R = get_aux(URL),
            response_body(R).

post(URL, ContentType, Body) -> R = post_aux(URL,ContentType,Body),
                                response_body(R).


post_aux(URL, ContentType, Body) -> request(post, {URL, [], ContentType, Body}).
get_aux(URL)                     -> request(get,  {URL, []}).

request(Method, Body) -> httpc:request(Method, Body, [], []).

response_body({ok, { _, _, Body}}) -> Body;
response_body({error,{A,_,B}}) -> io:format("Error -> ~p, ~p~n",A,B).

getjson([]) -> "{}";
getjson([H|T]) when H == 123 -> isback(T);
getjson([_|T]) -> getjson(T).

isback([H|T]) when H == 34 -> "{\""++T;
isback([_|T]) -> getjson(T).
