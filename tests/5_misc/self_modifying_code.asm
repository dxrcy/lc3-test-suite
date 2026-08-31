; code can modify itself

.ORIG x3000

    ld r0, Instr
    st r0 Dst
Dst
    br Fail   ; becomes and instruction
    brnp Fail ; check it set r1 to 0

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Instr and r1, r1, #0

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
