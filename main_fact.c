#include<stdio.h>
#include<stdlib.h>

extern unsigned int fact(int n) ; 

int main(int argc, char **argv){
	
	printf("fattoriale di %d: %d\n", atoi(argv[1]), fact(atoi(argv[1])));

	return 0;
}