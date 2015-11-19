% 17/11/2015  10:33pm
-module(twitter).
-export([start/0]).

start()-> 
	spawn( fun()->start_t()end). 


start_t()->
	try 
	consulta1(),
	consulta2(),
	consulta3(),
	timer:sleep(60000),
	start_t()
	catch
	_:_->timer:sleep(10000),start_t()
	end.

% OAuth realm="",oauth_version="1.0",oauth_consumer_key="14UM70VqbosMv5HYbW0dT4B0O",oauth_token="3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e",oauth_timestamp="1447907460",oauth_nonce="x3ThGnFTnSV",oauth_signature_method="HMAC-SHA1",oauth_signature="xSpc1D9I%2BtTpz5WX9EkJBe7EwQQ%3D"

consulta1()->
	Json=consultar("curl --get 'https://api.twitter.com/1.1/search/tweets.json' --data 'count=100&include_entities=false&lang=es&locale=es&q=RadioMonumental' --header 'Authorization: OAuth oauth_consumer_key=14UM70VqbosMv5HYbW0dT4B0O, oauth_nonce=x3ThGnFTnSV, oauth_signature=xSpc1D9I%2BtTpz5WX9EkJBe7EwQQ%3D, oauth_signature_method=HMAC-SHA1, oauth_timestamp=1447907460, oauth_token=3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e, oauth_version=1.0' --verbose"),
	S=json:parse(Json),
	Data=json:val(S,"statuses"),
	recorrer(Data).

% OAuth realm="",oauth_version="1.0",oauth_consumer_key="14UM70VqbosMv5HYbW0dT4B0O",oauth_token="3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e",oauth_timestamp="1447907460",oauth_nonce="m8xztyXwBGA",oauth_signature_method="HMAC-SHA1",oauth_signature="8PRstRTZDtHYXl%2BWktTkVRuNTko%3D"

consulta2()->
	Json=consultar("curl --get 'https://api.twitter.com/1.1/search/tweets.json' --data 'count=100&include_entities=false&lang=es&locale=es&q=MonumentalCR' --header 'Authorization: OAuth oauth_consumer_key=14UM70VqbosMv5HYbW0dT4B0O, oauth_nonce=m8xztyXwBGA, oauth_signature=8PRstRTZDtHYXl%2BWktTkVRuNTko%3D, oauth_signature_method=HMAC-SHA1, oauth_timestamp=1447907460, oauth_token=3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e, oauth_version=1.0' --verbose"),
	S=json:parse(Json),
	Data=json:val(S,"statuses"),
	recorrer(Data).

% OAuth realm="",oauth_version="1.0",oauth_consumer_key="14UM70VqbosMv5HYbW0dT4B0O",oauth_token="3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e",oauth_timestamp="1447907460",oauth_nonce="pZ5TKZ1ENTo",oauth_signature_method="HMAC-SHA1",oauth_signature="cX3MhtA8LHhMzyxj%2BWJ0onxiR%2Fo%3D"

consulta3()->
	Json=consultar("curl --get 'https://api.twitter.com/1.1/search/tweets.json' --data 'count=100&include_entities=false&lang=es&locale=es&q=noticiarepretel' --header 'Authorization: OAuth oauth_consumer_key=14UM70VqbosMv5HYbW0dT4B0O, oauth_nonce=pZ5TKZ1ENTo, oauth_signature=cX3MhtA8LHhMzyxj%2BWJ0onxiR%2Fo%3D, oauth_signature_method=HMAC-SHA1, oauth_timestamp=1447907460, oauth_token=3145489152-aUlBCTAf45tsDBlUFj2Sv49aXcimCqOwewzXO8e, oauth_version=1.0' --verbose"),
	S=json:parse(Json),
	Data=json:val(S,"statuses"),
	recorrer(Data).

consultar(Curl) ->
	R = os:cmd(Curl),
	eliminafinal(getjson(R)).


getjson([]) -> "{}";
getjson([H|T]) when H == 123 -> isback(T);
getjson([_|T]) -> getjson(T).


isback([H|T]) when H == 34 -> "{\""++T;
isback([_|T]) -> getjson(T).

recorrer([])->[];
recorrer([H|T])->Aux=nsimo(H,13),
		B=element(2,Aux),
		Id=element(2,nsimo(H,4)),
		Comentario=element(2,nsimo(H,5)),
		Fecha=element(2,nsimo(H,2)),
		User=element(2,nsimo(B,3)),
		parseador:insert(Id,User,Comentario,Fecha,"","","Twitter","",""),
		[Comentario,Fecha,User,{"Twitter"}]++recorrer(T).%[Comentario,Fecha,User,{"Twitter"}]

nsimo([],_N)->nil;
nsimo([H|_T], 1)->H;
nsimo([_H|T], N)->nsimo(T,N-1).

eliminafinal([])->[];
eliminafinal([44,34,115,101,97,114,099,104,095,109,101,116,97,100,97,116,97|_T])->"}";
eliminafinal([H|T])->[H|eliminafinal(T)].





