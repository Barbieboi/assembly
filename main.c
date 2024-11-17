//Main per provare le funzioni

#define _GNU_SOURCE 
#include <stdio.h>  
#include <stdlib.h> 
#include <string.h>
#include <time.h>


#define N 5
#define M 5

#define MAX 20

typedef struct nodo{
	int n ;
	struct nodo* next ;
}node_t ;


typedef struct strin {
    char *data;         // Stringa contenuta nel nodo
    struct strin *next;  // Puntatore al nodo successivo
} stringl;


void stampa_array(int *a, int n);
void stampa_matrice(int **a, int n , int m);
int * crea_arr(int n);
int **crea_mat(int n , int m);
stringl* createstringl(const char *str); 
void printStringl(stringl *head);
void append(stringl **head, const char *str);
char* generateRandomString(int length) ;
void creastringlis(stringl **head, int numStrings, int stringLength);
node_t *creanode(int n);
node_t *insertnode(node_t *head, int n);
void initlis(node_t**lis , int n);
void printlis(node_t *lis);
int compare(const void *a, const void *b);

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
extern void stampa_mat(int**a , int n , int m);
extern void stampa_strlis(stringl *head);
extern void removelis(node_t* lis, int n);
extern int equazione(int a , int b , int c , int x);
extern int binarysearch(int *a , int size ,int k);
extern int contacar(char *s, char k);
extern int lengthlis(node_t* lis);
extern int longest(char **s , int n);
extern int diagonale(int **a, int n);
extern void inverti(int *a, int n);

int main(int argc, char **argv){

	clock_t start = clock();
//	------------------------------
    

    
    
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

int compare(const void *a, const void *b) {
    // Cast dei puntatori void in puntatori a interi
    int int_a = *(int *)a;
    int int_b = *(int *)b;

    // Restituisce il risultato della sottrazione tra i due numeri
    return (int_a - int_b);
}

// Funzione per creare un nodo con una stringa
stringl* createstringl(const char *str) {
    stringl *newNode = (stringl *)malloc(sizeof(stringl)); // Alloca memoria per il nodo
    if (newNode == NULL) {
        perror("Errore nell'allocazione della memoria");
        exit(1); // Uscita in caso di errore
    }

    // Alloca memoria per la stringa e copia il contenuto
    newNode->data = strdup(str);
    newNode->next = NULL;  // Il nodo inizialmente non ha un nodo successivo

    return newNode;
}

// Funzione per stampare la lista
void printStringl(stringl *head) {
    stringl *current = head;
    while (current != NULL) {
        printf("%s -> ", current->data);
        current = current->next;
    }
    printf("NULL\n"); // Indica la fine della lista
}

// Funzione per inserire un nodo alla fine della lista
void append(stringl **head, const char *str) {
    stringl *newNode = createstringl(str);

    // Se la lista è vuota, il nuovo nodo è la testa
    if (*head == NULL) {
        *head = newNode;
    } else {
        stringl *current = *head;
        // Scorri fino all'ultimo nodo
        while (current->next != NULL) {
            current = current->next;
        }
        // Aggiungi il nuovo nodo in coda
        current->next = newNode;
    }
}

// Funzione per generare una stringa casuale di lunghezza n
char* generateRandomString(int length) {
    char *str = (char *)malloc(length + 1); // +1 per il terminatore null
    if (str == NULL) {
        perror("Errore nell'allocazione della memoria");
        exit(1); // Uscita in caso di errore
    }

    // Alfabeto da cui scegliere i caratteri
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int charsetSize = sizeof(charset) - 1; // La lunghezza dell'alfabeto (senza il terminatore null)

    // Genera una stringa casuale
    for (int i = 0; i < length; i++) {
        int randIndex = rand() % charsetSize;
        str[i] = charset[randIndex];
    }

    str[length] = '\0'; // Aggiungi il terminatore null
    return str;
}

// Funzione per inizializzare la lista con stringhe casuali
void creastringlis(stringl **head, int numStrings, int stringLength) {
    // Inizializza il generatore di numeri casuali
    srand(time(NULL));

    for (int i = 0; i < numStrings; i++) {
        // Genera una stringa casuale
        char *randomString = generateRandomString(stringLength);

        // Aggiungi la stringa alla lista
        append(head, randomString);

        // Libera la memoria della stringa (ora è copiata nella lista)
        free(randomString);
    }
}

node_t *creanode(int num){
	node_t *res = malloc(sizeof(*res));
	res->n = num ;
}

node_t* insertnode(node_t *head, int n){
	node_t *new = creanode(n);
	new->next = head;
	head = new ; 
	return new ;
}

void initlis(node_t**lis , int n){
	srand(time(NULL));
	node_t* nodo = NULL;
	for(int i = 0 ; i < n ; i++ ){
		*lis = insertnode(*lis, rand()%MAX);
	}
}

void printlis(node_t *lis){
	while(lis != NULL){
		printf("%d -> ", lis->n);
		lis = lis->next ;
	}
	printf ("NULL\n");
}