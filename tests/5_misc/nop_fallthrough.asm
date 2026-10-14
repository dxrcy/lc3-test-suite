; jmp to uninitialized mem should fall through instructions

.ORIG x3100

    add r6, r6, #1
    add r6, r6, #-1
    brnp Pass            ; second time branches
    add r6, r6, #1

    ld r0, GapAddr
    jmp r0               ; jump to x3000

    lea r0, FailMsg
    puts
    halt

Pass
    lea r0, PassMsg
    puts
    halt

GapAddr .FILL x3000

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
