        .data
 array: .word 0,1,2,3,4,5,6,7,8,9 @ vettore di 10 interi a 32 bit
  mess: .string "Il risultato e' %d\n" @ stringa che verrà passata alla printf

        .text
        .global main
        .type main, %function

  main: ldr r0, =array @ carico in r0 indirizzo iniziale dell'array
        mov r1, #10 @ numero di elementi dell'array
        mov r2, #0 @ inizializzo r2 a zero (result)
        mov r3, #0 @ r3 contiene indice for
  loop: cmp r3, r1
        beq fine
        ldr r12, [r0, r3, lsl #2] @ carico in r12 array[i]
        add r2, r2, r12 @ aggiorno result
        add r3, r3, #1 @ incremento indice for
        b loop
  fine: ldr r0, =mess @ carico in r0 indirizzo iniziale stringa messaggio
        mov r5, lr @ salvo lr in un registro che so la printf non sporcherà (non è la soluzione generale)
        mov r1, r2 @ sposto in r1 il valore result da stampare con la stringa
        bl printf @ invoco la printf
        mov r0, #0 @ return 0 quando esco dal main
        mov lr, r5 @ ripristino lr (ma non è la soluzione generale)
        mov pc, lr @ ritorno al preambolo gcc
