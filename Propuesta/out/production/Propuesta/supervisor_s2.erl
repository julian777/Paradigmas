-module(supervisor_s2).
-export([start_link/3, init/1]).
-behaviour(supervisor).

%% me inicializa quien me llame, proceso almacenado ?MODULE

start_link(Name, Limit, MFA) ->
  supervisor:start_link(?MODULE, {Name, Limit, MFA}).

init({Name, Limit, MFA}) ->
  MaxRestart = 1,
  MaxTime = 3600,
  {ok, {{one_for_all, MaxRestart, MaxTime},
    [{serv,
      {mnesia_serv, start_link, [Name, Limit, self(), MFA]},
      permanent,
      5000, % Shutdown time
      worker,
      [mnesia_serv]}]}}.