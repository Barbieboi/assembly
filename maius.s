.text
.global maius
.type maius , %function

maius :
	push {lr}
	mov r2 , #0

loop :
	ldrb r1,  [r0, r2] 
	cmp r1 , #0 	@ s == NULL
	beq end
	cmp r1 , #0x61
	blo next	
	cmp r1 , #0x7a
	bhi next
	sub r1 , #0x20
	strb r1 , [r0, r2]
	next :
	add r2 , #1
	b loop 

end :
	mov r0, #0
	pop {pc}


