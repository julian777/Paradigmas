-module(rest).
-export([post/3]).
-export([get/1]).
-export([response_body/1]).



post(URL, ContentType, Body) -> request(post, {URL, [], ContentType, Body}).
get(URL)                     -> request(get,  {URL, []}).

request(Method, Body) -> httpc:request(Method, Body, [], []).

response_body({ok, { _, _, Body}}) -> Body.


