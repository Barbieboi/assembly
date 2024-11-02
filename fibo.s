.text
.global fibo
.type fibo , %function

fibo : 
	mov r2, r0
	loop : 
	cmp r2 , #0
	beq zero 
	cmp r2, #1
	beq uno




