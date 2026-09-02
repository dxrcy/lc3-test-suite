; jumping to supervisor memory from user mode
; should crash with an ACV exception

.ORIG x3000

    ld r1, SupAddr ; check if we already set r0 to SupAddr
    not r1, r1     ; since the jmp r0 will jump above x3000
    add r1, r1, #1 ; so if it doesnt ACV we need to stop it
    add r1, r1, r0 ; manually from infinitely looping
    brz Fail

    ld r0, SupAddr

    ; jump to mem[x0100] should crash
    jmp r0

Fail
    ; if we reach here somehow the test failed
    lea r0, FailMsg
    puts
    halt

SupAddr .FILL x0100

FailMsg .STRINGZ "TEST_FAILED"

.END
