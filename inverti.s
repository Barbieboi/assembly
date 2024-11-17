.text
.global inverti
.type inverti , %function

inverti :
	push {r4}
	mov r2 , #0 @ r2 -> i 
	mov r3 , r1
	sub r3 , #1 @ r3 -> j = n - 1
	loop :
	cmp r2 , r3
	bge end
	ldr r4 , [r0, r2, lsl #2] @ r4 -> a[i]
	ldr r12 , [r0, r3, lsl #2] @ r12 -> a[j]
	str r4 , [r0, r3, lsl #2] @ a[j] -> a[i] 
	str r12 , [r0, r2, lsl #2] @ a[j] -> a[i]
	add r2 , #1
	sub r3 , #1
	b loop
end :
	pop {r4}
	mov pc , lr 

