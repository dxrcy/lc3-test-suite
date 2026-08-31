; writing io page memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ; write value to mem[xFE00] should crash
    sti r0, SupAddr

    ; if we reach here the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL xFE00

FailMsg .STRINGZ "TEST_FAILED"

.END

