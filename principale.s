.text
.global principale
.type principale , %function

principale :
	push {r4 , lr}
	mov r4 , #0
	mov r1 , r0
	loop :
	cmp r0 , #0
	beq end 
	ldr r0 , [r1] 
	push {r1}
	bl somma
	add r4 ,r4 , r0
	pop {r1}
	ldr r0 , [r1 , #4]
	mov r1 , r0 
	b loop
end :
	mov r0 , r4 
	pop {r4 , lr}
	mov pc , lr
