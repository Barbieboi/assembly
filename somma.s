.text
.global somma
.type somma , %function

somma :
	push {r4 , lr}
	mov r4 , r0
	mov r1 , #0
loop :
	ldrb r0 , [r4] , #1
	cmp r0 , #0
	beq end
	push {r1 ,r2}
	bl calcola
	pop {r1 ,r2}
	add r1 , r1 , r0 
	b loop 
end :
	mov r0 , r1
	pop {r4, lr}
	mov pc , lr


