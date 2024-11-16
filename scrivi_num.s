.text
.global main
.type main , %function

@ tentativo di scrittura di interi da riga di comando su file passato come primo argomento

main :
	push {r4 , r5 ,r6 ,lr}
	cmp r0 , #2
	blt ins_args
	mov r6 , r0 @ r6 -> n
	mov r5 , r1 @ r5 -> **argv
	ldr r2 , [r5 , #4] @ argv[1]
	mov r0 , r2 
	ldr r1 , =write
	bl  fopen
	cmp r0 , #0
	beq error
	mov r4 , r0 @ r4 -> f
	mov r2 , #2 @ r2 -> i = 2
	loop :
	push {r2}
	cmp r2 , r6 @ i < n
	beq end
	ldr r0 , [r5 , r2 , lsl #2] 
	bl atoi 
	mov r2, r0 
	ldr r1 , =msg
	mov r0 , r4 
	bl fprintf
	pop {r2}
	add r2 , r2 , #1
	b loop
end :

	@ Questa cosa rompe tutto ?
	mov r0 , r4
	bl fclose
	
	pop {r4 , r5 ,r6 ,lr}
	mov r0 , #0
	mov pc, lr


ins_args :
	ldr r0 , =ins_argsmsg
	bl printf
	mov r0 , #1
	b exit

error :
	ldr r0 , =errmsg
	bl printf
	mov r0 , #1
	b exit



.data 
	write :
		.string "w"
	ins_argsmsg :
		.string "Argomenti insufficenti\n"
	errmsg :
		.string "Error\n"
	msg : 
		.string "%5d\n"
	endmsg :
		.string "\0"
