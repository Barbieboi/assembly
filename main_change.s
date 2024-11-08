.text
.global main
.type main , %function

main :
	push {lr}
	cmp r0 , #4
	bne err
	mov r4 , r1
	ldr r0 , [r4 , #4] @ argv[1]
	ldr r5 , [r4 , #8] @ argv[2]
	ldrb r1 , [r5]
	ldr r6 , [r4 , #12]@ argv[3]
	ldrb r2 , [r6]
	bl change
	ldr r0 , =msg
	ldr r1 , [r4 , #4]  
	bl printf
	mov r0 , #0
	pop {pc}

err :
	ldr r0 , =err_msg
	bl printf
	mov r0 , #1
	pop {pc}

.data
	msg :
		.string "Nuova Stringa %s\n"
	err_msg :
		.string "Errore\n"

