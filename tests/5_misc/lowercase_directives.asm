; lowercase directives must allocate the correct number of words

.orig x3000

    lea r2, Label
    ldr r2, r2, #5

    add r2, r2, #-5
    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Label
         .blkw #2
         .stringz "hi"
         .fill #5

PassMsg  .stringz "TEST_PASSED"
FailMsg  .stringz "TEST_FAILED"

.end
