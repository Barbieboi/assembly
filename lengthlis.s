.text
.global lengthlis
.type lengthlis , %function

lengthlis :
		mov r2 , #0
	loop :
		cmp r0 , #0         @ list == NULL
        beq end 
        mov r1 , r0			@ r1 -> list
        ldr r0 , [r1 , #4]  @ list = list->next
        add r2 , r2 , #1
		b loop
    end :
        mov r0 , r2
        mov pc , lr 
