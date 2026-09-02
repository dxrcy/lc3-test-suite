; jumping to halts trap vector manually should crash

.ORIG x3000

    ld r1, HaltAddr ; check if we already set r0 to HaltAddr
    not r1, r1      ; since the jmp r0 will jump above x3000
    add r1, r1, #1  ; so if it doesnt ACV we need to stop it
    add r1, r1, r0  ; manually from infinitely looping
    brz Fail

    ld r0, HaltAddr
    jmp r0

    ; if we reach here the test failed
Fail
    lea r0, FailMsg
    puts
    halt

HaltAddr .FILL x25 ; halt trap vector

FailMsg .STRINGZ "TEST_FAILED"

.END
