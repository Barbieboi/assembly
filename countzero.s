.text
.global countzero
.type countzero , %function

countzero :
	mov r3 , #0
	loop :
	cmp r3 , r1 @ i == n
	beq end 
	ldr r2, [r0] , #4
	cmp r2 , #0
	addeq r3 , r3 ,#1
	b loop
	end :
	mov r0 , r3
	mov pc , lr
