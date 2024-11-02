.text
.global fact
.type fact , %function

fact : 
	push {lr}

	mov r1, r0
	mov r2 , #1
	loop :
	cmp r1 , #0
	beq end
	mul r2 , r1 
	sub r1 , #1 
	b loop
	end :
	mov r0 , r2 
	pop {pc}

