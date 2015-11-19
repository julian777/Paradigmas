#include <stdlib.h>
#include <stdio.h>
#include  <sys/types.h>

int iniciarErlang(){
	// Esto hace magia
	int i = system("gnome-terminal -x bash -c \"cd Prolog/ && swipl server.pl\"");
	printf ("Prolog: %d.\n",i);
	return i;
}

int iniciarProlog(){
	// Esto hace magia TAMBIEN
	int i = system("gnome-terminal -x bash -c \"cd Erlang/ && erl -make && erl -sname enode -setcookie  erlang -run main\"");
	printf ("Erlang: %d.\n",i);
	return i;
}

int main(){
    pid_t  pid;
    pid = fork();
    if (pid == 0) {
        iniciarProlog();
    }else{
	    pid = fork();
	    if (pid == 0) 
		iniciarErlang();
		
    }
	return 0;
}
