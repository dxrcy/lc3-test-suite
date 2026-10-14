; reserved opcode 1101 should crash

.ORIG x3000

    .FILL xD000 ; 1101 0000 0000 0000

    lea r0, FailMsg
    puts
    halt

FailMsg .STRINGZ "TEST_FAILED"

.END
