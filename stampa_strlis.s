.text
.global stampa_strlis
.type stampa_strlis , %function

stampa_strlis :
	push {lr}
	loop :
	cmp r0 , #0
	beq end
	mov r2 , r0 
	ldr r0 , =string
	ldr r1 , [r2] , #4
	push {r2}
	bl printf
	pop {r2} 
	ldr r0 , [r2] 
	b loop
end :
	ldr r0 , =null
	bl printf
	mov r0 , #0
	pop {pc}

.data 
	string :
		.string "%s -> "
	null :
		.string "NULL\n"
