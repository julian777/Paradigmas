-module(main).
-export([start/0,classify/0,update/1]).

start()->
	mnesia:create_schema([node()]),
	mnesia:start(), parseador:init(),
	face:start(),
	twitter:start(),
	timer:sleep(3000),
	spawn(fun()-> classify() end),
	io:format("Sirvio~n").

classify()->
	{_,T}=parseador:select_post(),
	update(getTheme(T)),
	timer:sleep(30000),
	classify().


update(L) -> [parseador:update(I,T)|| {I,T} <- L ].

getTheme([])->[];
getTheme([{I,M}|T])->[{I,consult(M)}]++getTheme(T).

consult(X)->client:pedir(X).
