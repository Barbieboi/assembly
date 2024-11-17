.text
.global binarysearch
.type binarysearch , %function

binarysearch :
	push {r4 , r5}
	cmp r0 , #0
	moveq pc , lr
	mov r3 , #0 @ r3 -> i = indice più a sx
	mov r4 , r1 @ r4 -> j = indice più a dx
	loop :
	cmp r3 , r4 
	bgt not_found
	add r5 , r3 , r4 
	lsr r5 , r5 , #1 @ r5 -> (i+j)/2  = punto medio del sottoarray
	ldr r12 , [r0 , r5 , lsl #2]
	cmp r12 , r2 
	beq found
	addgt r3 ,r5 ,#1 @ i = (i+j)/2 + 1
	sublt r4 , r5 , #1 @ j = (i+j)/2 - 1
	b loop 
not_found :
	mov r1 , #-1
found :
	mov r0 , r5
	pop {r4 , r5} 
	mov pc , lr
	