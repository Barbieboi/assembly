//Main per provare le funzioni

#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 
#include <time.h>


#define N 10

#define MAX 10

void stampa_array(int *a, int n);
int * crea_arr(int n);

extern int find_max(int *arr, int n);
extern int fact(int n);
extern int contapari(int n);
extern void sum_array(int *arr, int n);
extern int somma_cond(int* arr, int n ,int range);
extern int stringa_cmp(char *s1, char *s2 );
extern int countzero(int *arr, int n);
extern void maius(char *s);
extern void change(char *s, char t, char c);

int main(int argc, char **argv){
	
	clock_t start = clock();
//	------------------------------

	maius(argv[1]);

	printf("Risultato di maius %s\n", argv[1]);


//	------------------------------

	clock_t end = clock();
	double tempo = (double)(end - start)/CLOCKS_PER_SEC ; 
	printf("tempo: %f\n", tempo) ;

	return 0;
}

void stampa_array(int *a, int n){
	for(int i = 0; i< n; i++){
		printf("%4d", a[i]);
	}
	puts("");
}

int * crea_arr(int n){
	int *a = malloc(sizeof(int)*n);
	srand(time(NULL));
	for(int i = 0 ; i < n ; i++){
		a[i] = rand()%MAX;
	}
	return a ;
}