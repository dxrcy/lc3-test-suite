; .STRINGZ must end in a null terminator

.ORIG x3000

    lea r0, PassMsg
    ldr r0, r0, #11 ; '\0'
    brz Pass

    halt

Pass
    lea r0, PassMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
        .FILL #1

.END
