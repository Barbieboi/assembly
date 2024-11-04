#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 
#include <time.h>

extern void sum_array(int *arr, int n);

int main(int argc, char **argv){
	
	int n = 100000000;
	int *a = malloc(sizeof(int)*n);
	srand(time(NULL));
	for(int i = 0 ; i < n ; i++){
		a[i] = rand();
	}
	clock_t start = clock();
	sum_array(a, n);

	free(a);
	clock_t end = clock();
	double tempo = (double)(end - start)/CLOCKS_PER_SEC ; 
	printf("tempo: %f\n", tempo) ;

	return 0;
}