; add behaviour matches expected hex values

.ORIG x3000

    ld r0, NegativeOne
    ld r1, Zero
    ld r2, One

    add r3, r0, #1 ; -1 + 1 = 0
    add r3, r3, r1
    brnp Fail

    add r3, r1, #1 ; 0 + 1 = 1
    add r3, r3, r0
    brnp Fail

    add r3, r2, #-1 ; 1 + -1 = 0
    add r3, r3, r1
    brnp Fail

    add r3, r1, #-1 ; 0 + -1 = -1
    add r3, r3, r2
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

One         .FILL x0001
Zero        .FILL x0000
NegativeOne .FILL xFFFF

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
