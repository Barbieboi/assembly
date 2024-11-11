.text
.global main
.type main , %function

@ obiettivo creare matrice n righe * m colonne con m primo numero da riga di comando

main :
	push {r4,r5,r6,r7,r8,r9,r10,lr}
	cmp r0 , #2
	bls ins_args
	sub r4 , r0 , #1 @ r4 -> n
	mov r7 , r1 	@ r7 -> **argv
	ldr r0 , [r7 , #4] @ r0 -> argv[1]
	bl atoi 
	mov r5 , r0 @ r5 -> m
	mov r12 , #8
	mul r2 , r4 , r12 @ r2 -> (n*sizeof(int*))
	mov r0 , r2
	bl malloc 
	mov r6 , r0 @ r6 -> **a
	cmp r0 , #0
	beq mem_error
	mov r2 , #0 @ r2 -> i 
for_malloc :
	cmp r2 , r4 @ i <= n
	beq end_mem 
	push {r2}
	mov r3 , #4
	mul r0 , r5 , r3 @ r0 -> (m*sizeof(int))
	bl malloc
	cmp r0 , #0
	pop {r2} 
	beq mem_error	
	str r0 , [r6 ,r2 , lsl #3]  @ a[i] = malloc(...)
	add r2 , #1
	b for_malloc 
end_mem :
	mov r2 , #1 @ r2 -> i = 1 
for_fill :
	cmp r2 , r4 @ i <= n
	bhi end_fill
	ldr r0 , [r7 , r2, lsl #2] @ r0 -> argv[i]
	push {r2}
	bl atoi  
	pop {r2} 
	mov r9 , r0 @ r9 -> num
	sub r2 , #1  
	ldr r10 , [r6  , r2 ,lsl #3] @ r10 -> *a[i-1]
	mov r3 , #0 @ r3 -> j = 0 
inner_for :
	cmp r3 , r5 @ j < m
	beq end_inner
	str r9 , [r10 , r3 , lsl #2] @ a[i-1][j] = num
	add r9 , #1@ num++ 
	add r3 , #1 @j++
	b inner_for	
end_inner :
	add r2 , #2
	b for_fill
end_fill :
	mov r0 , r6 
	mov r1 , r4 
	mov r2 , r5 
	bl stampa_mat
	mov r2 , #0 
for_map :
	cmp r2 , r4
	beq end_map
	ldr r0 , [r6 , r2 , lsl #3]  
	mov r1 , r5
	push {r2}
	ldr r2 , =funz 
	bl map
	pop {r2}
	add r2 , #1
	b for_map
end_map :
	ldr r0 , =separator
	bl puts 
	mov r0 , r6 
	mov r1 , r4 
	mov r2 , r5 
	bl stampa_mat
return :
	mov r0 , #0
	pop {r4 , r5 ,r6, r7 , r8,r9,r10,lr}
	mov pc , lr




funz :
	push {lr}
	mul r0 , r0 , r0
	pop {pc}


ins_args :
	ldr r0 , =noargs_msg
	bl perror 
	mov r0 , #1
	b exit


mem_error :
	ldr r0 , =memerror_msg
	bl perror 
	mov r0 , #1
	b exit

.data
	separator :
		.string "------------------------"	
	noargs_msg : 
		.string "Argomenti insufficenti"
	memerror_msg :
		.string "Memoria Insufficiente"
