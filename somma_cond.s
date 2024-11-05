.text
.global somma_cond
.type somma_cond , %function

@ r0 -> a r1 -> n r2 -> range
somma_cond : 
	
	mov r3 , #0
	mov r4 , #0
	
	loop :
	cmp r3 , r1 @ i == n
	beq end 
	ldr r12 , [r0,r3 , lsl #2]
	cmp r12 , r2
	addgt r4 , r12
	add r3 , #1
	b loop
	
	end :
	mov r0 , r4
	mov pc, lr 

