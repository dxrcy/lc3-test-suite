; reading io page memory with ldr from user mode
; should crash with an ACV exception

.ORIG x3000

    ld r1, SupAddr

    ; read value from mem[xFE00] should crash
    ldr r0, r1, #0

    ; if we reach here the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL xFE00

FailMsg .STRINGZ "TEST_FAILED"

.END
