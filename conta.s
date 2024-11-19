.text
.global conta
.type conta , %function

conta :
	cmp r0 , #0 
	beq end 
	mov r2 , #0
	ldrb r3 , [r0] , #1
	loop :
	cmp r3 , #0
	beq end
	cmp r3 , r1
	addeq r2 , #1
	ldrb r3 , [r0] , #1
	b loop 
	end :
	mov r0 , r2 
	mov pc , lr

