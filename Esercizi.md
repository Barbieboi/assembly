# Aeso_ass_2425

---

### Esercizio 4: Calcolo della somma di una serie di numeri

**Obiettivo**: Scrivere un programma in Assembly che calcoli la somma dei primi 5 numeri naturali (1, 2, 3, 4, 5) usando un ciclo `loop`.

**Descrizione**:
1. Il programma deve caricare la somma iniziale (0) in un registro.
2. Deve poi iterare attraverso i primi 5 numeri, aggiungendoli progressivamente alla somma.
3. Infine, il programma deve stampare la somma totale.

---

### Codice Assembly (per ARM)

```assembly
    .data
sum_result: .asciz "Somma totale: %d\n" ; Stringa per la stampa del risultato

    .text
    .global _start

_start:
    MOV R0, #0          ; Inizializza la somma a 0 in R0
    MOV R1, #1          ; Inizializza il contatore a 1 in R1
    MOV R2, #5          ; Limite del ciclo (somma i numeri da 1 a 5)

loop:
    ADD R0, R0, R1      ; Aggiunge il contatore R1 alla somma in R0
    ADD R1, R1, #1      ; Incrementa il contatore di 1
    CMP R1, R2          ; Confronta il contatore con il limite (5)
    BLE loop            ; Se R1 <= R2, continua il ciclo

    ; Stampa il risultato
    LDR R0, =sum_result ; Carica l'indirizzo della stringa "Somma totale: %d\n"
    MOV R1, R0          ; Copia la somma totale in R1 per la stampa
    BL printf           ; Chiama la funzione printf per stampare

    ; Terminare il programma
    MOV R7, #1          ; System call per uscire
    SWI 0               ; Esegui l'uscita
```

---

### Esercizio 5: Contare i numeri pari tra 1 e 10

**Obiettivo**: Scrivere un programma in Assembly che conti quanti numeri pari ci sono tra 1 e 10.

**Descrizione**:
1. Il programma deve inizializzare un contatore a 0.
2. Deve quindi iterare da 1 a 10, verificando per ogni numero se è pari.
3. Se il numero è pari, incrementare il contatore.
4. Infine, stampare il numero totale di numeri pari.

---

### Codice Assembly (per ARM)

```assembly
    .data
even_result: .asciz "Numeri pari trovati: %d\n" ; Stringa per la stampa del risultato

    .text
    .global _start

_start:
    MOV R0, #0          ; Inizializza il contatore dei numeri pari a 0
    MOV R1, #1          ; Inizializza il contatore del ciclo a 1
    MOV R2, #10         ; Limite del ciclo (fino a 10)

check_even:
    AND R3, R1, #1      ; Verifica se R1 è pari (bit di parità in R3)
    CMP R3, #0          ; Se il bit è 0, R1 è pari
    ADDNE R1, R1, #1    ; Se dispari, passa al prossimo numero

    ADDEQ R0, R0, #1    ; Se pari, incrementa il contatore dei numeri pari in R0
    ADD R1, R1, #1      ; Incrementa il contatore per passare al prossimo numero
    CMP R1, R2          ; Confronta con il limite
    BLE check_even      ; Se R1 <= 10, continua il ciclo

    ; Stampa il risultato
    LDR R0, =even_result ; Carica l'indirizzo della stringa "Numeri pari trovati: %d\n"
    MOV R1, R0           ; Copia il contatore dei pari in R1 per la stampa
    BL printf            ; Chiama la funzione printf per stampare

    ; Terminare il programma
    MOV R7, #1           ; System call per uscire
    SWI 0                ; Esegui l'uscita
```

---

### Spiegazione

- **CMP** e **BLE/BLEQ**: Viene utilizzato per confrontare valori e proseguire il ciclo se la condizione è vera.
- **AND**: Permette di controllare se un numero è pari applicando un’operazione bit a bit (parità determinata quando il bit meno significativo è 0).
- **ADDNE/ADDEQ**: Aggiunge un valore a un registro solo se la condizione è vera (NE = Not Equal, EQ = Equal).

---

### Esercizio 6: Calcolo del fattoriale di un numero

**Obiettivo**: Scrivere un programma in Assembly che calcoli il fattoriale di un numero (ad esempio, 5!) utilizzando un ciclo `loop`.

**Descrizione**:
1. Il programma deve caricare un numero intero (ad esempio, 5) in un registro.
2. Utilizzando un ciclo, deve calcolare il fattoriale di quel numero e memorizzare il risultato in un altro registro.
3. Infine, deve stampare il valore del fattoriale.

---

### Codice Assembly (per ARM)

```assembly
    .data
fact_result: .asciz "Fattoriale: %d\n" ; Stringa per la stampa del risultato

    .text
    .global _start

_start:
    MOV R0, #5          ; Numero di cui calcolare il fattoriale
    MOV R1, #1          ; Inizializza R1 a 1 per contenere il risultato del fattoriale
    MOV R2, R0          ; Copia R0 in R2 come contatore del ciclo

factorial_loop:
    MUL R1, R1, R2      ; Moltiplica il risultato attuale per il contatore
    SUB R2, R2, #1      ; Decrementa il contatore di 1
    CMP R2, #1          ; Controlla se il contatore è 1
    BGT factorial_loop  ; Continua il ciclo se il contatore è maggiore di 1

    ; Stampa il risultato
    LDR R0, =fact_result ; Carica l'indirizzo della stringa "Fattoriale: %d\n"
    MOV R1, R1           ; Copia il valore del fattoriale in R1 per la stampa
    BL printf            ; Chiama la funzione printf per stampare

    ; Terminare il programma
    MOV R7, #1           ; System call per uscire
    SWI 0                ; Esegui l'uscita
```

---

### Esercizio 7: Calcolo della somma dei numeri pari da 1 a N

**Obiettivo**: Scrivere un programma in Assembly che calcoli la somma di tutti i numeri pari da 1 a un numero `N` specificato (ad esempio, 10).

**Descrizione**:
1. Il programma deve caricare il valore di `N` in un registro.
2. Utilizzando un ciclo, deve sommare solo i numeri pari da 1 a `N`.
3. Alla fine, il programma deve stampare il risultato della somma.

---

### Codice Assembly (per ARM)

```assembly
    .data
sum_even_result: .asciz "Somma dei numeri pari: %d\n" ; Stringa per la stampa del risultato

    .text
    .global _start

_start:
    MOV R0, #10         ; Numero N limite (es. somma numeri pari fino a 10)
    MOV R1, #0          ; Inizializza la somma a 0 in R1
    MOV R2, #2          ; Inizializza il contatore al primo numero pari (2)

sum_even_loop:
    ADD R1, R1, R2      ; Aggiunge il contatore (numero pari) alla somma
    ADD R2, R2, #2      ; Incrementa il contatore di 2 per passare al prossimo pari
    CMP R2, R0          ; Controlla se il contatore ha superato il limite N
    BLE sum_even_loop   ; Continua il ciclo se R2 <= N

    ; Stampa il risultato
    LDR R0, =sum_even_result ; Carica l'indirizzo della stringa "Somma dei numeri pari: %d\n"
    MOV R1, R1              ; Copia il valore della somma in R1 per la stampa
    BL printf               ; Chiama la funzione printf per stampare

    ; Terminare il programma
    MOV R7, #1              ; System call per uscire
    SWI 0                   ; Esegui l'uscita
```

---

### Spiegazione

- **MUL**: Utilizzato per calcolare il prodotto per il fattoriale.
- **ADD** con passo di 2: Utilizzato per sommare solo numeri pari incrementando di 2 ad ogni ciclo.
- **BLE** e **BGT**: Controlli condizionali utilizzati per gestire i cicli in base alla condizione attuale del contatore.

---

### Esercizio 8: Calcolo della sequenza di Fibonacci

**Obiettivo**: Scrivere un programma in Assembly che calcoli i primi `N` numeri della sequenza di Fibonacci e li memorizzi in memoria.

**Descrizione**:
1. Il programma deve calcolare la sequenza di Fibonacci fino a un numero `N` (ad esempio, `N = 10`).
2. Utilizzare un ciclo per generare la sequenza e memorizzare ogni numero successivo in memoria.
3. Dopo il calcolo, il programma dovrebbe visualizzare i numeri della sequenza.

---

### Codice Assembly (per ARM)

```assembly
    .data
fibonacci_msg: .asciz "Sequenza di Fibonacci fino a N: "
newline: .asciz "\n"
fibonacci: .space 40     ; Spazio per memorizzare 10 numeri della sequenza (4 byte per numero)

    .text
    .global _start

_start:
    MOV R0, #0           ; Primo numero di Fibonacci
    MOV R1, #1           ; Secondo numero di Fibonacci
    MOV R2, #10          ; Numero di termini della sequenza da calcolare
    LDR R3, =fibonacci   ; Carica l'indirizzo di partenza per memorizzare i valori

    STR R0, [R3], #4     ; Salva il primo numero (0) in memoria
    STR R1, [R3], #4     ; Salva il secondo numero (1) in memoria

fibonacci_loop:
    ADD R4, R0, R1       ; Calcola il prossimo numero di Fibonacci
    STR R4, [R3], #4     ; Memorizza il risultato in memoria e incrementa l'indirizzo
    MOV R0, R1           ; Aggiorna R0 al valore di R1
    MOV R1, R4           ; Aggiorna R1 al valore di R4
    SUBS R2, R2, #1      ; Decrementa il contatore
    BGT fibonacci_loop   ; Continua finché R2 > 0

    ; Stampa la sequenza
    LDR R0, =fibonacci_msg
    BL printf            ; Stampa messaggio iniziale
    LDR R3, =fibonacci   ; Ritorna all'inizio dell'array

print_loop:
    LDR R1, [R3], #4     ; Carica il prossimo numero di Fibonacci
    MOV R0, R1           ; Copia il valore in R0 per la stampa
    BL printf            ; Stampa il numero
    LDR R1, =newline     ; Stampa una nuova linea tra i numeri
    BL printf
    CMP R3, R2           ; Confronta l'indirizzo con il limite dell'array
    BNE print_loop       ; Continua a stampare finché ci sono numeri

    ; Terminare il programma
    MOV R7, #1           ; System call per uscire
    SWI 0                ; Esegui l'uscita
```

---

### Esercizio 9: Ricerca del massimo in un array

**Obiettivo**: Scrivere un programma in Assembly che trovi il valore massimo in un array di numeri memorizzato in memoria.

**Descrizione**:
1. Definire un array di numeri in memoria (ad esempio, `{3, 7, 2, 9, 5}`).
2. Iterare attraverso l’array per trovare il valore massimo.
3. Memorizzare il massimo trovato in un registro e stamparlo.

---

### Codice Assembly (per ARM)

```assembly
    .data
array: .word 3, 7, 2, 9, 5   ; Array di numeri
array_size: .word 5           ; Lunghezza dell'array
max_msg: .asciz "Massimo valore nell'array: %d\n"

    .text
    .global _start

_start:
    LDR R0, =array       ; Carica l'indirizzo di partenza dell'array
    LDR R1, =array_size  ; Carica la lunghezza dell'array
    LDR R2, [R0]         ; Inizializza il massimo con il primo valore dell'array

find_max:
    ADD R0, R0, #4       ; Sposta l'indirizzo al prossimo elemento
    LDR R3, [R0]         ; Carica il prossimo elemento dell'array
    CMP R3, R2           ; Confronta l'elemento con il massimo attuale
    MOVGT R2, R3         ; Se l'elemento è maggiore, aggiorna il massimo
    SUBS R1, R1, #1      ; Decrementa il contatore degli elementi
    BGT find_max         ; Continua finché ci sono elementi

    ; Stampa il massimo
    LDR R0, =max_msg     ; Carica il messaggio di stampa
    MOV R1, R2           ; Copia il massimo trovato in R1 per la stampa
    BL printf            ; Stampa il risultato

    ; Terminare il programma
    MOV R7, #1           ; System call per uscire
    SWI 0                ; Esegui l'uscita
```

---

### Spiegazione

- **Fibonacci**: Utilizza una serie di registri per calcolare e salvare i valori della sequenza in memoria.
- **STR** e **LDR con incremento post-indirizzo** (`[R3], #4`): Usati per memorizzare e recuperare i valori successivi nell'array.
- **MOVGT**: Istruzione condizionale usata per aggiornare il massimo solo se un nuovo valore è maggiore.
- **print_loop** e **find_max**: Esempi di cicli condizionali che iterano fino a una condizione specifica.

---

### Esercizio 10: Ordinamento di un array (Bubble Sort)

**Obiettivo**: Scrivere un programma in Assembly che ordini un array di numeri interi utilizzando l'algoritmo di ordinamento `Bubble Sort`.

**Descrizione**:
1. Definire un array di numeri in memoria (ad esempio, `{9, 3, 7, 5, 1}`).
2. Implementare l'algoritmo `Bubble Sort` per ordinare l'array in ordine crescente.
3. Una volta ordinato l'array, stamparlo elemento per elemento.

---

### Codice Assembly (per ARM)

```assembly
    .data
array: .word 9, 3, 7, 5, 1   ; Array da ordinare
array_size: .word 5           ; Lunghezza dell'array
sorted_msg: .asciz "Array ordinato: %d\n"

    .text
    .global _start

_start:
    LDR R4, =array_size      ; Carica la dimensione dell'array in R4
    LDR R5, =array           ; Carica l'indirizzo di partenza dell'array in R5

bubble_sort:
    MOV R6, R4               ; R6 è il contatore esterno del ciclo
    SUB R6, R6, #1           ; R6 = array_size - 1

outer_loop:
    MOV R7, #0               ; R7 è il contatore interno del ciclo

inner_loop:
    LDR R0, [R5, R7, LSL #2]     ; Carica array[j] in R0
    LDR R1, [R5, R7, LSL #2 + 4] ; Carica array[j+1] in R1
    CMP R0, R1                   ; Confronta array[j] con array[j+1]
    BLE skip_swap                ; Se array[j] <= array[j+1], salta lo scambio

    ; Scambio array[j] e array[j+1]
    STR R1, [R5, R7, LSL #2]     ; Memorizza array[j+1] in array[j]
    STR R0, [R5, R7, LSL #2 + 4] ; Memorizza array[j] in array[j+1]

skip_swap:
    ADD R7, R7, #1           ; Incrementa il contatore interno
    CMP R7, R6               ; Controlla se R7 ha raggiunto il limite R6
    BLT inner_loop           ; Continua il ciclo interno se R7 < R6

    SUBS R6, R6, #1          ; Decrementa il contatore esterno
    BGT outer_loop           ; Continua il ciclo esterno se R6 > 0

    ; Stampa l'array ordinato
    MOV R7, #0               ; Reimposta contatore per la stampa

print_loop:
    LDR R0, [R5, R7, LSL #2] ; Carica l'elemento corrente in R0
    LDR R1, =sorted_msg      ; Carica il messaggio di stampa
    BL printf                ; Stampa l'elemento
    ADD R7, R7, #1           ; Incrementa il contatore per l'array
    CMP R7, R4               ; Controlla se R7 ha raggiunto la lunghezza dell'array
    BLT print_loop           ; Continua a stampare finché ci sono elementi

    ; Terminare il programma
    MOV R7, #1               ; System call per uscire
    SWI 0                    ; Esegui l'uscita
```

---

### Esercizio 11: Somma degli elementi di un array con filtro condizionale

**Obiettivo**: Scrivere un programma in Assembly che calcoli la somma degli elementi di un array che sono maggiori di un valore soglia specificato.

**Descrizione**:
1. Definire un array di numeri e una soglia (ad esempio, `5`).
2. Il programma deve iterare sull’array, sommando solo i numeri che sono maggiori della soglia.
3. Al termine, deve stampare la somma totale.

---

### Codice Assembly (per ARM)

```assembly
    .data
array: .word 2, 8, 3, 7, 10   ; Array di numeri
array_size: .word 5           ; Lunghezza dell'array
threshold: .word 5            ; Soglia
sum_msg: .asciz "Somma dei numeri sopra la soglia: %d\n"

    .text
    .global _start

_start:
    LDR R4, =array_size       ; Carica la dimensione dell'array in R4
    LDR R5, =array            ; Carica l'indirizzo di partenza dell'array in R5
    LDR R6, =threshold        ; Carica il valore della soglia in R6
    MOV R7, #0                ; Inizializza la somma a 0

sum_loop:
    LDR R0, [R5], #4          ; Carica il prossimo elemento dell'array in R0
    CMP R0, R6                ; Confronta l'elemento con la soglia
    BLE skip_add              ; Se l'elemento è minore o uguale alla soglia, salta l'addizione

    ADD R7, R7, R0            ; Aggiunge l'elemento alla somma

skip_add:
    SUBS R4, R4, #1           ; Decrementa il contatore degli elementi
    BGT sum_loop              ; Continua il ciclo finché ci sono elementi

    ; Stampa la somma
    LDR R0, =sum_msg          ; Carica il messaggio di stampa
    MOV R1, R7                ; Copia il valore della somma in R1 per la stampa
    BL printf                 ; Stampa il risultato

    ; Terminare il programma
    MOV R7, #1                ; System call per uscire
    SWI 0                     ; Esegui l'uscita
```

---

### Spiegazione

- **Bubble Sort**: Implementato con due cicli `outer_loop` e `inner_loop`. Ogni iterazione del ciclo esterno riduce la quantità di elementi da confrontare, mentre il ciclo interno scambia gli elementi adiacenti se non sono in ordine crescente.
- **Soglia condizionale nella somma**: Verifica ogni elemento rispetto a un valore di soglia prima di aggiungerlo alla somma.
- **INDIRIZZAMENTO POST-INCREMENTO (`[R5], #4`)**: Usato per iterare su ciascun elemento dell'array, aggiornando automaticamente l’indirizzo.

---

### Esercizio 14: Calcolo del determinante di una matrice 2x2

**Obiettivo**: Scrivere un programma in Assembly che calcoli il determinante di una matrice 2x2. Il determinante di una matrice 2x2 con elementi `a, b, c, d` è dato dalla formula: `det = a * d - b * c`.

**Descrizione**:
1. Definire una matrice 2x2 in memoria (ad esempio, `{a = 3, b = 8, c = 4, d = 6}`).
2. Calcolare il determinante utilizzando la formula sopra.
3. Stampare il risultato.

---

### Codice Assembly (per ARM)

```assembly
    .data
matrix: .word 3, 8, 4, 6       ; Matrice 2x2: a=3, b=8, c=4, d=6
det_msg: .asciz "Determinante della matrice: %d\n"

    .text
    .global _start

_start:
    LDR R0, =matrix             ; Carica l'indirizzo della matrice in R0
    LDR R1, [R0]                ; Carica a in R1
    LDR R2, [R0, #4]            ; Carica b in R2
    LDR R3, [R0, #8]            ; Carica c in R3
    LDR R4, [R0, #12]           ; Carica d in R4

    ; Calcola il determinante: det = a * d - b * c
    MUL R5, R1, R4              ; R5 = a * d
    MUL R6, R2, R3              ; R6 = b * c
    SUB R7, R5, R6              ; R7 = a * d - b * c (determinante)

    ; Stampa il determinante
    LDR R0, =det_msg            ; Carica il messaggio di stampa
    MOV R1, R7                  ; Copia il determinante in R1 per la stampa
    BL printf                   ; Stampa il risultato

    ; Terminare il programma
    MOV R7, #1                  ; System call per uscire
    SWI 0                       ; Esegui l'uscita
```

---

### Esercizio 15: Calcolo del fattoriale di un numero (funzione ricorsiva)

**Obiettivo**: Scrivere un programma in Assembly che calcoli il fattoriale di un numero intero `n` usando la ricorsione. Il fattoriale di un numero `n` è definito come `n! = n * (n-1) * (n-2) * ... * 1`, con `0! = 1`.

**Descrizione**:
1. Definire un numero `n` (ad esempio, `n = 5`).
2. Implementare una funzione ricorsiva per calcolare `n!`.
3. Stampare il risultato del calcolo.

---

### Codice Assembly (per ARM)

```assembly
    .data
number: .word 5                    ; Numero per cui calcolare il fattoriale
fact_msg: .asciz "Fattoriale: %d\n"

    .text
    .global _start

_start:
    LDR R0, =number                ; Carica l'indirizzo di `n` in R0
    LDR R1, [R0]                   ; Carica il valore di `n` in R1
    MOV R2, #1                     ; Imposta R2 a 1, che sarà il risultato finale

    BL factorial                   ; Chiama la funzione `factorial`

    ; Stampa il risultato
    LDR R0, =fact_msg              ; Carica il messaggio
    MOV R1, R2                     ; Copia il risultato di fattoriale in R1 per la stampa
    BL printf                      ; Stampa il risultato

    ; Terminare il programma
    MOV R7, #1                     ; System call per uscire
    SWI 0                          ; Esegui l'uscita

factorial:
    CMP R1, #0                     ; Controlla se `n` è uguale a 0
    BEQ base_case                  ; Se `n == 0`, vai al caso base

    ; Caso ricorsivo: n * factorial(n-1)
    PUSH {R1}                      ; Salva n sullo stack
    SUB R1, R1, #1                 ; R1 = n - 1
    BL factorial                   ; Chiama factorial(n-1)
    POP {R3}                       ; Recupera il valore di n
    MUL R2, R3, R2                 ; R2 = n * factorial(n-1)
    BX LR                          ; Ritorna al chiamante

base_case:
    MOV R2, #1                     ; Caso base: factorial(0) = 1
    BX LR                          ; Ritorna al chiamante
```

---

### Spiegazione

- **Determinante di una matrice 2x2**: Utilizza l'accesso a specifici elementi della matrice tramite offset di memoria e il calcolo con le operazioni `MUL` e `SUB`.
- **Fattoriale ricorsivo**: Implementa la ricorsione tramite il salvataggio dello stato di `n` sullo stack. Il programma chiama la funzione `factorial` riducendo `n` a ogni chiamata ricorsiva fino a raggiungere il caso base `n = 0`. Per il calcolo, recupera i valori dallo stack e moltiplica il risultato corrente `R2` con `n`.

---

### Esercizio 16: Ricerca del massimo valore in una matrice 3x3

**Obiettivo**: Scrivere un programma in Assembly che trovi il massimo valore in una matrice 3x3 di numeri interi.

**Descrizione**:
1. Definire una matrice 3x3 in memoria (ad esempio, `{1, 8, 3, 7, 2, 9, 4, 6, 5}`).
2. Implementare un ciclo che itera attraverso tutti gli elementi della matrice.
3. Trovare e memorizzare il massimo valore.
4. Stampare il valore massimo.

---

### Codice Assembly (per ARM)

```assembly
    .data
matrix: .word 1, 8, 3, 7, 2, 9, 4, 6, 5   ; Matrice 3x3
matrix_size: .word 9                      ; Numero totale di elementi
max_msg: .asciz "Valore massimo nella matrice: %d\n"

    .text
    .global _start

_start:
    LDR R4, =matrix            ; Carica l'indirizzo della matrice in R4
    LDR R5, =matrix_size       ; Carica la dimensione totale della matrice in R5
    LDR R6, [R4]               ; Inizializza R6 con il primo elemento (valore massimo iniziale)
    MOV R7, #1                 ; Imposta l'indice per partire dal secondo elemento

find_max_loop:
    LDR R0, [R4, R7, LSL #2]   ; Carica l'elemento successivo in R0
    CMP R0, R6                 ; Confronta R0 con il massimo attuale (R6)
    BLE skip_update            ; Se R0 <= R6, salta l'aggiornamento
    MOV R6, R0                 ; Altrimenti, aggiorna il massimo

skip_update:
    ADD R7, R7, #1             ; Incrementa l'indice
    CMP R7, R5                 ; Controlla se l'indice ha raggiunto la fine della matrice
    BLT find_max_loop          ; Continua il ciclo se ci sono altri elementi

    ; Stampa il valore massimo
    LDR R0, =max_msg           ; Carica il messaggio di stampa
    MOV R1, R6                 ; Copia il valore massimo in R1 per la stampa
    BL printf                  ; Stampa il massimo

    ; Terminare il programma
    MOV R7, #1                 ; System call per uscire
    SWI 0                      ; Esegui l'uscita
```

---

### Esercizio 17: Confronto tra due stringhe

**Obiettivo**: Scrivere un programma in Assembly che confronti due stringhe carattere per carattere e verifichi se sono uguali. Se le stringhe sono uguali, stampare "Le stringhe sono uguali"; altrimenti, stampare "Le stringhe sono diverse".

**Descrizione**:
1. Definire due stringhe in memoria.
2. Implementare un ciclo che confronti i caratteri di entrambe le stringhe uno alla volta.
3. Fermarsi al primo carattere diverso oppure quando entrambe le stringhe terminano.
4. Stampare il risultato del confronto.

---

### Codice Assembly (per ARM)

```assembly
    .data
string1: .asciz "Assembly"
string2: .asciz "Assembly"
equal_msg: .asciz "Le stringhe sono uguali\n"
diff_msg: .asciz "Le stringhe sono diverse\n"

    .text
    .global _start

_start:
    LDR R0, =string1           ; Carica l'indirizzo di string1 in R0
    LDR R1, =string2           ; Carica l'indirizzo di string2 in R1
    MOV R2, #0                 ; Imposta R2 a 0, sarà il flag di confronto (0 = uguali)

compare_loop:
    LDRB R3, [R0], #1          ; Carica il carattere corrente di string1 in R3 e incrementa R0
    LDRB R4, [R1], #1          ; Carica il carattere corrente di string2 in R4 e incrementa R1
    CMP R3, R4                 ; Confronta i caratteri
    BNE strings_different      ; Se i caratteri sono diversi, vai a strings_different
    CMP R3, #0                 ; Controlla se abbiamo raggiunto il terminatore null
    BEQ strings_equal          ; Se entrambi i terminatori sono stati trovati, vai a strings_equal
    B compare_loop             ; Continua il ciclo

strings_different:
    MOV R2, #1                 ; Imposta il flag a 1 (stringhe diverse)

strings_equal:
    ; Stampa il risultato
    CMP R2, #0                 ; Controlla il flag
    BEQ print_equal            ; Se il flag è 0, le stringhe sono uguali
    LDR R0, =diff_msg          ; Altrimenti, sono diverse
    B print_msg

print_equal:
    LDR R0, =equal_msg         ; Carica il messaggio di uguaglianza

print_msg:
    BL printf                  ; Stampa il risultato

    ; Terminare il programma
    MOV R7, #1                 ; System call per uscire
    SWI 0                      ; Esegui l'uscita
```

---

### Spiegazione

- **Ricerca del massimo valore in una matrice**: Questo esercizio utilizza un ciclo che scorre ogni elemento della matrice. Il valore massimo viene continuamente aggiornato se viene trovato un elemento maggiore. Si utilizza l'indirizzamento con offset per iterare sulla matrice.
- **Confronto tra due stringhe**: Il ciclo confronta ogni carattere delle due stringhe e si ferma al primo carattere diverso o alla fine delle stringhe. Si utilizza `LDRB` per caricare i caratteri byte per byte. Il programma termina stampando il messaggio di uguaglianza o disuguaglianza in base al risultato del confronto.