:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library('http/http_parameters')).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).
        
:- http_handler(/, func,[]).


func(Request) :-
    http_parameters(Request,[ msg(A,[ optional(true) ])]), 
    format('Content-type: text/plain~n~n'),
    split_string(A, "_", "", L),
    analizar(L,B),
    format('~p',B).


word(["saprissa"]) :- write("futbol").
word(["jaja"]) :- write("chiste").

word("hola","saludos2").

analizar(X,R):- printout(X,R).

printout([],"none"):- false.
printout(N,R):- word(N,R),!.
printout([N|Tail],R):- word(N,R) ; printout(Tail,R).



