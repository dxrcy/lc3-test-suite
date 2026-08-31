; jsrr does not set condition codes

.ORIG x3000

    lea r1, A
    lea r2, C
    lea r3, E

    and r0, r0, #0  ; cc z

    jsrr r1
A   brz B
    br Fail
B

    add r0, r0, #1  ; cc p

    jsrr r2
C   brp D
    br Fail
D

    add r0, r0, #-2 ; cc n

    jsrr r3
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
