; reading supervisor memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ; read value from mem[x0100] should crash
    ldi r0, SupAddr

    ; if we reach here the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL x0100

FailMsg .STRINGZ "TEST_FAILED"

.END
