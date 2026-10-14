; all user memory x3000-xFDFF should init to zero

.ORIG x3000

    ld r2, Last
    lea r0, End

Loop
    ldr r1, r0, #0
    brnp Fail

    add r0, r0, #1
    add r3, r2, r0
    brnp Loop

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Last .FILL x200 ; 00000010 00000000 -> twoscomp -> 11111110 00000000 -> xFE00

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

End

.END
