; jumping right before io page memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ld r0, SupAddr

    ; jump to mem[xFDFF] should NOP then crash when PC moves into io page memory
    jmp r0

    ; if we reach here somehow the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL xFDFF

FailMsg .STRINGZ "TEST_FAILED"

.END
