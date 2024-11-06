.text
.global find_max
.type find_max , %function

@ massimo in un array di int

find_max :
	push {lr}
	mov r3 , #0
	ldr r2 , [r0]
	loop :
	cmp r3 , r1
	beq end
	ldr r12 , [r0] , #4
	cmp r12 , r2
	movgt r12 , r2 
	add r3 , #1
	b loop
	end :
	mov r0 , r2 
	pop {pc}
