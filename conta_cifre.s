.text
.global conta_cifre
.type conta_cifre , %function

conta_cifre :
	push {r4 , lr}
	mov r4 , #0
	mov r2 , r0
	loop :
	cmp r0 , #0
	beq end
	mov r2 , r0 
	ldr r0 , [r2]
	push {r1 , r2}
	bl conta 
	add r4 , r4 , r0 
	pop {r1 , r2} 
	ldr r0 , [r2 ,#4]
	b loop 
	end :
	mov r0 , r4 
	pop {r4 , pc}
