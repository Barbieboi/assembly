.text
.global stampa_mat
.type stampa_mat , %function

@ r0 -> **a r1 -> n r2 -> m
stampa_mat :
	push { r4 , r5 , r6 ,lr}
	mov r4 , r0 
	mov r5 , r1 
	mov r6 , r2 
	mov r2 , #0
	row_loop :
		cmp r2 , r5
		beq endrow
		ldr r12 , [r4 , r2 , lsl #2] 
		mov r3 , #0
		push {r2}
		column_loop :
			cmp r3 , r6 
			beq next_row 
			ldr r1 , [r12 , r3 , lsl #2] 
			ldr r0 , =num
			push {r3 , r12}
			bl printf
			pop {r3 , r12}
			add r3 , #1
			b column_loop
		next_row :
		ldr r0 , =line
		bl puts
		pop {r2}
		add r2 , #1
		b row_loop
	endrow :
	mov r0 , #0
	pop {r4 ,r5 , r6 , pc}

.data
	num :
		.string "%4d"
	line :
		.string " "
