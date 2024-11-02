#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 

extern unsigned int fibo(int n) ;

int main(int argc, char **argv){
	
	printf( "%d", (atoi(argv[1]))) ;

	return 0;
}