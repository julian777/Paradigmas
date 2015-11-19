-module(face).
-export([start/0]).

%Inicia el proceso de consulta de comentarios a facebook en un hilo.
start()-> 
	spawn(fun()->
			L=stringrequest(),
			data(L)
		end).

%Consulta los comentarios de la primera página de facebook, los guarda en mnesia, y consulta la siguiente página.
data([H|T])->
	L=request(H),
	save(L),
	timer:sleep(60000),
	data(T++[H]).

%Consulta una pagina en específico,y le devuelve una lista de listas de comentarios de cada publicación en este formato = [ [{ID,NAME,MESSAGE,TIME,FUENTE},{}...] , [{ID,NAME,MESSAGE,TIME,FUENTE}...]]
request(X)-> 
	ssl:start(),
	inets:start(),
	{ok, {{_NewVersion, 200, _NewReasonPhrase}, _Header, Body}} = httpc:request(get, {X, []}, [], []),
	Data=json:val(json:val(json:parse(Body),"posts"),"data"),
	[[comments(C)||C<-L]||L<-post(Data)].

%Devuelve los string request para consultar cada una de las páginas especificadas
stringrequest()->
	["https://graph.facebook.com/v2.5/"++[X]++"?fields=posts{comments{from,message,created_time}}&access_token=1607249119540971|oyhsDi_xQ8LXtXQq2LBtonfDUVs" || X <- pages()].

%Específica todas las páginas que se van a consultar.
pages()->
	["ExtraTV","crhoy.comnoticias","teleticadeportes","Telenoticias7","larepublicacr","lanacion","sem.universidad"].

%Formatea los valores optenidos de una consulta en una tupla con los atributos del comentario
comments(V)->
	{json:val(V,"id"),json:val(json:val(V,"from"),"name"),json:val(V,"message"),json:val(V,"created_time"),"facebook"}.

%Filtra los posts optenidos,para eliminar aquellos que no tienen comentarios.
post([])->[];
post([H|T])->
	X=json:val(H,"comments"),
	if X==null->post(T);
		  true->[json:val(X,"data")|post(T)]
	end.

%Guarda una lista de comentarios en mnesia
save([])->[];
save([{I,N,M,H,F}|T])->
	parseador:insert(I,N,M,H,"","",F,"",""),
	save(T);
	
save([H|T])->
	save(H),
	save(T). 






