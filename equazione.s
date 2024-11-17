.text
.global equazione
.type equazione , %function

@ scrivere una funzione ARMv7 che, presi 3 parametri interi 
@ a, b e c, e un quarto parametro intero x, calcoli ax^2+bx+c.

equazione :
	mul r12 , r3 , r3 
	mul r0 , r0 , r12 @ r0 -> ax^2
	mul r1 , r3  , r1 @ r1 -> bx
	add r0 , r0 , r1  @ r0 -> ax^2 + bx
	add r0 , r2 
	mov pc , lr 

