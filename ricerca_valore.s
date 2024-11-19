.text
.global ricerca_valore
.type ricerca_valore , %function

ricerca_valore :
	push {lr}
	mov r2 , r0
	loop :
	cmp r0 , #0
	beq not_found
	ldr r0 , [r2]
	push {r1 , r2}
	bl strcmp
	pop {r1 , r2 }
	cmp r0 , #0
	beq found
	ldr r0 , [r2 , #4]
	b loop

not_found :
	pop {lr}
	mov r0 , #0
	mov pc , lr
found :
	pop {lr}
	mov r0 , #1
	mov pc , lr
