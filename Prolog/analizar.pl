%la idea es recibir el texto desde erlang, hacerle un split [""] y mandarlo al metodo "analizar"
%este va a devolver un true si es el tema, si no va a consultar a los otros bancos de palabra
%si no cae en ninguno se etiqueta como desconocido

concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).

quicksort([],[]):-!.
quicksort([X|Y],L):-obtenerlista(X,Y,Lme,Lma),quicksort(Lme,T),
            quicksort(Lma,R), concatenar(T,[X|R],L).

word(["saprissa"]) :- write("futbol").
word(["jaja"]) :- write("chiste").

analizar(X):- printout(X).

printout([]):- false.
printout(N):- word(N),!.
printout([N|Tail]):- word(N) ; printout(Tail).

