; jumping right before io page memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ld r1, SupAddr ; check if we already set r0 to SupAddr
    not r1, r1     ; since the jmp r0 could wrap to above x3000
    add r1, r1, #1 ; so if it doesnt ACV we need to stop it
    add r1, r1, r0 ; manually from infinitely looping
    brz Fail

    ld r0, SupAddr

    ; jump to mem[xFDFF] should NOP then crash when PC moves into io page memory
    jmp r0

    ; if we reach here somehow the test failed
Fail
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL xFDFF

FailMsg .STRINGZ "TEST_FAILED"

.END
