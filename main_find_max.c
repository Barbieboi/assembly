#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 
#include <time.h>

#define N 10

#define MAX 100

extern int find_max(int *arr, int n);

int main(int argc, char **argv){
	
	int *a = malloc(sizeof(int)*N);
	srand(time(NULL));
	for(int i = 0 ; i < N ; i++){
		a[i] = rand()%MAX;
	}
	clock_t start = clock();
	printf("massimo dell'array: %d\n",find_max(a, N));

	free(a);
	clock_t end = clock();
	double tempo = (double)(end - start)/CLOCKS_PER_SEC ; 
	printf("tempo: %f\n", tempo) ;

	return 0;
}