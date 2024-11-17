.text
.global diagonale
.type diagonale , %function

@ Scrivere una funzione ARMv7 che prende come parametri un puntatore a una matrice quadrata NxN 
@ di interi e la dimensione N della matrice. 
@ La funzione deve calcolare e restituire la somma degli elementi della diagonale principale.

diagonale :
	push {r4}
	mov r4 , r0
	mov r2 , #0 	@ counter diagonale
	mov r12 , #0	@ res
	loop :
	cmp r2 , r1 	
	beq end
	ldr r0 , [r4 , r2 , lsl #2]
	ldr r3 , [r0 , r2 , lsl #2]
	add r12 , r12 , r3
	add r2 , #1
	b loop
	end :
	pop {r4}
	mov r0 , r12
	mov pc , lr
