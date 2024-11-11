.text
.global stampa_mat
.type stampa_mat , %function

@ r0 -> int **a r1 -> n r2 -> m 

stampa_mat :
	push {r4 , r5 , lr}
	mov r4 , r1
	mov r5 , r2 
	mov r2 , #0
loop :
	cmp r2 , r4 
	beq end_stampa
	ldr r0 , [r6 , r2 , lsl #3]  
	mov r1 , r5
	push {r2}
	bl stampa_arr
	pop {r2}
	add r2 , #1
	b loop
end_stampa :
	pop {r4 , r5 , lr}
	mov r0 , #0
	mov pc , lr 
