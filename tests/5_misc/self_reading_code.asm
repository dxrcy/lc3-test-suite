; code can read itself

.ORIG x3000

Self
    ld r0, Self ; 0010 000 111111111

    ld r1, Exp
    not r1, r1
    add r1, r1, #1

    add r0, r0, r1

    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Exp .FILL x21FF

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
