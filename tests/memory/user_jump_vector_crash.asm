; jumping to halts trap vector manually should crash

.ORIG x3000

    ld r0, HaltAddr
    jmp r0

    ; if we reach here the test failed
    lea r0, FailMsg
    puts
    halt

HaltAddr .FILL x25 ; halt trap vector

FailMsg .STRINGZ "TEST_FAILED"

.END
