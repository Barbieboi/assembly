.text
.global binarysearch
.type binarysearch , %function

binarysearch :
	push {r4 , r5}
	cmp r0 , #0
	moveq pc , lr
	mov r3 , #0 @ r3 -> i = indice più a sx
	mov r4 , r1 @ r4 -> j = indice più a dx = n-1
	sub r4 , r4 , #1 
	loop :
	cmp r3 , r4 
	bgt not_found @ i > j 
	add r5 , r3 , r4 
	lsr r5 , r5 , #1 @ r5 -> (i+j)/2  = punto medio del sottoarray
	ldr r12 , [r0 , r5 , lsl #2]
	cmp r2 , r12 @ a[mid] == k
	beq found
	sublt r4, r5, #1 @ j = mid - 1 if k < a[mid] vado a sx
	addgt r3, r5, #1 @ i = mid + 1 if k > a[mid] vado a dx
	b loop 
not_found :
	mov r5 , #-1
found :
	mov r0 , r5
	pop {r4 , r5} 
	mov pc , lr
