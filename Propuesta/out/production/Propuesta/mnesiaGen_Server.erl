-module(mnesiaGen_Server).
-author("julian").

-behaviour(gen_server).
%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
  handle_call/3,
  start/0,
  stop/0,
  handle_cast/2,
  handle_info/2,
  terminate/2,
  code_change/3]).

-define(SERVER, ?MODULE).


start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


init([]) ->

  %%application:load(mnesia),
  rpc:multicall([node()], application, start, [mnesia]),
  %%mnesia_monitor:set_env(dir,"/home/julian/Escritorio/PropuestaMNESIA/base"),
  %%net_kernel:start([paradigmas, shortnames]),
 %% erlang:set_cookie([node()], galleta),

  mnesiaLogico:install([node()]),
  rpc:multicall([node()], application, start, [mnesia]).

handle_call(start, _From, State) ->
  {start, normal, ok, State};

handle_call(stop, _From, State) ->
  {stop, normal, ok, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.


%%%===================================================================
%%% Internal functions
%%%===================================================================

start() ->
  Nodes = [node()],

  rpc:multicall(Nodes, application, start, [mnesia]),
  mnesia:wait_for_tables([twitter,facebook], 5000).

stop()->
  Nodes = [node()],
  rpc:multicall(Nodes, application, stop, [mnesia]).
