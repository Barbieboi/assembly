        .text
        .global conta
        .type conta, %function

conta :
        cmp r0 , #0
        mov r3 , #0 @ r3 -> res
        beq end
        ldrb r1 , [r0] , #1 @ r1 -> current
        mov r2 , r1 @ r2 -> prec
        loop :
        cmp r2 , #0
        beq end
        ldrb r1 , [r0] , #1
        add r2 , #1
        cmp r2 , r1 
        addeq r3 , r3  ,#1
        mov r2 , r1
        b loop 
        end :
        mov r0 , r3 
        mov pc , lr

