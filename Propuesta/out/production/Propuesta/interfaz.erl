%%% API module for the pool
-module(interfaz).
-export([start_link/0, stop/0, start_pool/3,
  run/2, sync_queue/2, async_queue/2, stop_pool/1]).

start_link() ->
  supervisor_sup_s1:start_link().

stop() ->
  supervisor_sup_s1:stop().

start_pool(Name, Limit, {M,F,A}) ->
  supervisor_sup_s1:start_pool(Name, Limit, {M,F,A}).

stop_pool(Name) ->
  supervisor_sup_s1:stop_pool(Name).

run(Name, Args) ->
  mnesia_serv:run(Name, Args).

async_queue(Name, Args) ->
  mnesia_serv:async_queue(Name, Args).

sync_queue(Name, Args) ->
  mnesia_serv:sync_queue(Name, Args).