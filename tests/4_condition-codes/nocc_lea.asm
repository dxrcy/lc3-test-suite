; lea does not set condition codes

.ORIG x3000

    and r0, r0, #0 ; cc z
Lbl lea r0, Lbl
    brnp Fail

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
