//Main per provare le funzioni

#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 
#include <time.h>


#define N 5
#define M 5

#define MAX 10

typedef struct nodo{
	int n ;
	struct nodo* next ;
}node_t ;

void stampa_array(int *a, int n);
void stampa_matrice(int **a, int n , int m);
int * crea_arr(int n);
int **crea_mat(int n , int m);

extern int find_max(int *arr, int n);
extern int fact(int n);
extern int contapari(int n);
extern void sum_array(int *arr, int n);
extern int somma_cond(int* arr, int n ,int range);
extern int stringa_cmp(char *s1, char *s2 );
extern int countzero(int *arr, int n);
extern void maius(char *s);
extern void change(char *s, char t, char c);
extern node_t *merge(node_t *primo, node_t *secondo) ;
extern void stampa_arr(int* a, int n);


int main(int argc, char **argv){
	
	clock_t start = clock();
//	------------------------------
	int *arr = crea_arr(N);
    int** mat = crea_mat(N, M);
	
  
    stampa_matrice(mat, N , M );
    puts("--------Versione ARMv7------");


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

void stampa_matrice(int **a, int n , int m){
    for(int i = 0; i < n; i++){
        stampa_array( a[i], m );
    }
}

int * crea_arr(int n){
	int *a = malloc(sizeof(int)*n);
	srand(time(NULL));
	for(int i = 0 ; i < n ; i++){
		a[i] = rand()%MAX;
	}
	return a ;
}

int **crea_mat(int n , int m){
	int **arr = malloc(sizeof(*arr)*n) ;
	for(int i = 0 ; i < n ; i++ ){
		arr[i]= crea_arr(m);
	}
    return arr;
}

