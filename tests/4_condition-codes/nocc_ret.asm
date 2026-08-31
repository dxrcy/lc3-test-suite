; ret does not set condition codes

.ORIG x3000

    and r0, r0, #0  ; cc z

    jsr A
    brz B
    br Fail
A   ret
B

    add r0, r0, #1  ; cc p

    jsr C
    brp D
    br Fail
C   ret
D

    add r0, r0, #-2 ; cc n

    jsr E
    brn F
    br Fail
E   ret
F

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
