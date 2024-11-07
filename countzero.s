.text
.global countzero
.type countzero , %function

countzero :
	mov r2 , #0
	mov r3 , #0
	loop :
	cmp r2 , r1 @ i == n
	beq end 
	ldr r12, [r0] , #4
	cmp r12 , #0
	addeq r3 ,#1
	add r2 , #1
	b loop
	end :
	mov r0 , r3
	mov pc , lr

