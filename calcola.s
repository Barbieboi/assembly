.text
.global calcola
.type calcola , %function

calcola :
	mov r1 , #0
	cmp r0 , #48
	blt end
	cmp r0 , #57
	bgt end
	cmp r0 , #0
	beq end
	sub r1 , r0 , #48
end :
	mov r0 , r1
	mov pc , lr
