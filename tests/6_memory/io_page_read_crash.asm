; reading io page memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ; read value from mem[xFE00] should crash
    ldi r0, SupAddr

    ; if we reach here the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL xFE00

FailMsg .STRINGZ "TEST_FAILED"

.END
