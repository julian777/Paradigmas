-module(supervisor_worker_s3).
-export([start_link/1, init/1]).
-behaviour(supervisor).

start_link(MFA = {_,_,_}) ->
  supervisor:start_link(?MODULE, MFA).

init({M,F,A}) ->
  {ok, {{simple_one_for_one, 5, 3600},
    [{cliente_worker,
      {M,F,A},
      temporary, 5000, worker, [M]}]}}.
