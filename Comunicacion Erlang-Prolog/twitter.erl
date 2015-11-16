-module(twitter).

-export([consultar/1]).

% curl --get 'https://api.twitter.com/1.1/search/tweets.json?' --data 'q=RadioMonumental&lang=es&locale=es&count=10&include_entities=false' --header 'Authorization: OAuth oauth_consumer_key=NUu2jpRu3TsltZSnSIAZErFgC, oauth_nonce=d57rUnZ7ZBI, oauth_signature=C5o8PPWFee0vn7xGGK%2BW73oA%2FAM%3D, oauth_signature_method=HMAC-SHA1, oauth_timestamp=1447693196, oauth_token=3653935402-omsVz87Ou5q6FSeoyEjqwBZ5d9BenWxkmWpbwn0, oauth_version=1.0' --verbose

consultar(Curl) ->
	R = os:cmd(Curl),
	getjson(R).

getjson([]) -> "{}";
getjson([H|T]) when H == 123 -> isback(T);
getjson([_|T]) -> getjson(T).

isback([H|T]) when H == 34 -> "{\""++T;
isback([_|T]) -> getjson(T).
