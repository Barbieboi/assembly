#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 

extern int contapari(int n);

int main(int argc, char **argv){
	
	printf("somma numeri pari tra 1 e %d: %d\n",atoi(argv[1]) ,contapari(atoi(argv[1])));

	return 0;
}