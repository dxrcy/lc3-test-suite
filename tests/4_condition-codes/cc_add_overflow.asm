; add sets condition codes correctly when overflowing

.ORIG x3000

     ; x7FFF              + 1                  = x8000
     ; 0b0111111111111111 + 0b0000000000000001 = 0b1000000000000000

    ld r0, Limit
    add r0, r0, #1
    brzp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt


PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

Limit   .FILL x7FFF

.END
