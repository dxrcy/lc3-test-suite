; operands can be separated by commas with no whitespace

.ORIG x3000

    halt

    add r0,r1,r2
    add r0,r1,#0
    and r0,r1,r2
    and r0,r1,#0
    not r0,r1
    ldr r0,r1,#0
    str r0,r1,#0
    ld r0,Label
    lea r0,Label
    st r0,Label
    br Label

Label .BLKW #1

.END
