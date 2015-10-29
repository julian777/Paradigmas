-module(supervisor_sup_s1).
-behaviour(supervisor).
-export([start_link/0, stop/0, start_pool/3, stop_pool/1]).
-export([init/1]).

%% start_link, cita que interfaz lo puede inicializar:
start_link() ->
  supervisor:start_link({local, interfaz}, ?MODULE, []).


%% este es el supervisor de mas alto nivel, el de arriba arriba

%% technically, a supervisor can not be killed in an easy way.
%% Let's do it brutally!

%% stop detiene todo lo que existe
%% por el momento es el metodo que vamos a usar para detener

stop() ->
  case whereis(interfaz) of
    P when is_pid(P) ->
      exit(P, kill);
    _ -> ok
  end.

%% start_pool, me crea un grupo especifico
%% voy a necesitar dos parametros, el numero de trabajadores
%% que la piscina aceptara
%% y el {M,F,A} que el supervisor trabajador debera asignar a cada trabajador para inicializarlo
%% tambien usamos un nombre

start_pool(Name, Limit, MFA) ->
  ChildSpec = {Name,
    {supervisor_s2, start_link, [Name, Limit, MFA]},
    permanent, 10500, supervisor, [supervisor_s2]},
  supervisor:start_child(interfaz, ChildSpec).

%% osea, cada supervisor es permanente, tambien hay un tiempo maximo de shutdown 10500
%% es el tiempo que da para que todos los hijos se detengan, pude varirar segun el sistema


%% me detiene un grupo en especifico
%% yo le mando el nombre de mi hijo, el que hice en el metodo start_pool
%% y este lo busca en la piscina y lo detiene, luego lo mata

stop_pool(Name) ->
  supervisor:terminate_child(interfaz, Name),
  supervisor:delete_child(interfaz, Name).

%% init/1, es la unica llamada de retorno supervision de los hijos
%% MaxRestart = 6
%% MaxTime = 3600
%% {ok, {{one_for_one, MaxRestart, MaxTime}, []}}.

init([]) ->
  {ok, {{one_for_one, 6, 3600}, []}}.
