.text
.global contapari
.type contapari , %function

@ contare i numeri pari tra 1 ed N

	contapari : 
		push {lr}
		mov r3 , r0
		mov r0, #0
		mov r1 , #0
	loop :
		add r0 , r0 , #1
		cmp r0, r3
		bgt end
		mov r2 , r0
		eor r2 , r2 ,#1
		cmp r2 , r0
		blt loop
		add r1 , #1
		b loop
	end :
		mov r0, r1
		pop {pc}
