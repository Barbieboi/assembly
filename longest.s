.text
.global longest
.type longest , %function

@ restituire l'indice della stringa più lunga in un array  

longest :
	push {r4, r5 , lr}
	mov r5 , r0 
	ldr r0 , [r5]
	push {r1}
	bl length
	pop {r1}
	mov r3 , r0
	mov r4 , #0
	mov r2 , #1
	loop :
	cmp r2 , r1 
	beq end 
	ldr r0 , [r5 , r2 , lsl #2]
	push {r1 , r2 , r3}
	bl length
	pop {r1 ,r2 ,r3}
	cmp r0 , r3
	movgt r3 , r0 
	movgt r4 , r2
	add r2 , r2 ,#1
	b loop
end :
	mov r0 , r4 
	pop {r4 ,r5, lr}
	mov pc , lr


length :
	cmp r0 , #0
	moveq pc, lr
	mov r2 , #0
	ldrb r1 , [r0]
	length_loop :
	cmp r1 , #0
	moveq r0 , r2
	moveq pc , lr
	ldrb r1 , [r0] , #1
	add r2 , r2 , #1
	b length_loop

