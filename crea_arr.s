.text
.global main
.type main , %function

@ legge interi da riga di comando, allocae rempie l'array, infine lo stampa 

main : 
	push {r4, r5 , r6 , r7 ,lr}
	cmp r0 , #1
	beq err 
	mov r4 , r0
	mov r5 , r1 @ r5 -> **argv
	sub r4 , #1	@ r4 -> n
	mov r7 , #4
	mul r0 , r4 , r7
	bl malloc
	cmp r0 , #0
	beq err
	mov r6 , r0 @ r6 -> *a
	mov r7 , #0 @ r7  -> i
	ldr r0 , [r5] , #4
loop :	
	cmp r7 , r4
	beq end
	ldr r0 , [r5] , #4
	bl atoi
	str r0 , [r6 , r7 , lsl #2]
	add r7 , #1
	b loop
end :
	mov r0 , r6
	mov r1 , r4 
	bl stampa_arr
	mov r0 , r6 
	bl free
	mov r0 , #0
	pop {r4, r5 , r6 , r7 ,pc}


err :
	ldr r0 , =errmsg
	bl perror 
	mov r0 , #1
	b exit

	

.data
	errmsg :
		.string "Something went wrong"
