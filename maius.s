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
	cmphi r1 , #0x7a
	blt m
	add r2 , #1
	b loop 

m :	
	sub r1 , #0x20
	strb r1 , [r0, r2]
	add r2 , #1
	b loop


end :
	mov r0, #0
	pop {pc}


