-module(clientes_workers).
-behaviour(gen_server).
-export([start_link/4, stop/1]).
-export([init/1, handle_call/3, handle_cast/2,
  handle_info/2, code_change/3, terminate/2]).

start_link(Task, Delay, Max, SendTo) ->
  gen_server:start_link(?MODULE, {Task, Delay, Max, SendTo} , []).

stop(Pid) ->
  gen_server:call(Pid, stop).

%% solo envia una tarea, un Delay o tiempo de retardo, Max es el numero de veces que se va a enviar
%% SendTo es un Pid o un nombre al que debe llegar el mensaje
%% esta funcion init, es la que debe llamar a otra funcion que sea inserta_base_mnesia
%% esta funcion se hace aqui mismo y lo que hace es insertar en mnesia

%% aqui es donde esta la division de los cuatro espacios:
%% interfaz:run(cliente,["doy",10000,10,self()]).
%% interfaz:run(cliente,["mensaje",letargo,cantidadvecesrepitemensaje,YoSoySelf()])

%% init({Operation,val1,val2,val3,val4,val5,val7,val8}) ->
%%{ok,{Operation,val1,val2,val3,val4,val5,val7,val8}}.

init({Task, Delay, Max, SendTo}) ->
  {ok, {Task, Delay, Max, SendTo}, Delay}.

%%% OTP Callbacks
handle_call(stop, _From, State) ->
  {stop, normal, ok, State};
handle_call(_Msg, _From, State) ->
  {noreply, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

%% cuando el tiempo de espera vence, puedo con flush autoconsultar como va la cosa, me devuelve hilo y mensaje
handle_info(timeout, {Task, Delay, Max, SendTo}) ->
  SendTo ! {self(), Task},
  if Max =:= infinity ->
    {noreply, {Task, Delay, Max, SendTo}, Delay};
    Max =< 1 ->
      {stop, normal, {Task, Delay, 0, SendTo}};
    Max > 1  ->
      {noreply, {Task, Delay, Max-1, SendTo}, Delay}
  end.
%% We cannot use handle_info below: if that ever happens,
%% we cancel the timeouts (Delay) and basically zombify
%% the entire process. It's better to crash in this case.
%% handle_info(_Msg, State) ->
%%    {noreply, State}.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

terminate(_Reason, _State) -> ok.
