; jumping to supervisor memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ld r0, SupAddr

    ; jump to mem[x0100] should crash
    jmp r0

    ; if we reach here somehow the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL x0100

FailMsg .STRINGZ "TEST_FAILED"

.END

