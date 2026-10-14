; a zero word is a nop

.ORIG x3000

    .FILL x0000 ; nop

    lea r0, PassMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"

.END
