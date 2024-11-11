.text
.global map
.type map , %function

@	r0 -> a r1 -> n r2 -> f(int -> int)

map :
	push {lr}
	mov r3 , r0 
	mov r12 , #0
loop :
	cmp r12 , r1 
	beq end 
	push {r12}
	ldr r0 , [r3,  r12 , lsl #2] 
	blx r2 
	str r0 , [r3 , r12 , lsl #2] 
	pop {r12}
	add r12 , #1
	b loop 
end :
	mov r0 , #0
	pop {pc}
