.text
.global contapari
.type contapari , %function

@ contare la somma dei numeri pari tra 1 ed N

	contapari : 
		push {lr}
		mov r3 , r0 	@ 	r3 -> n
		mov r0, #0 		@	r0 -> i
		mov r1 , #0 	@ 	r1 -> ris
	loop :
		add r0 , r0 , #1	
		cmp r0, r3
		bgt end
		eor r2 , r0 ,#1
		cmp r2 , r0
		blt loop
		add r1 , r0
		b loop
	end :
		mov r0, r1
		pop {pc}
