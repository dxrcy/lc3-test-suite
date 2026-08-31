; pc increments correctly through sequential instructions

.ORIG x3000

    ; each instruction is one word

    and r0, r0, #0
    add r0, r0, #1
    add r0, r0, #1
    add r0, r0, #1


    add r0, r0, #-3
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
