; jsr does not set condition codes

.ORIG x3000

    and r0, r0, #0  ; cc z

    jsr A
A   brz B
    br Fail
B

    add r0, r0, #1  ; cc p

    jsr C
C   brp D
    br Fail
D

    add r0, r0, #-2 ; cc n

    jsr E
E   brn F
    br Fail
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
