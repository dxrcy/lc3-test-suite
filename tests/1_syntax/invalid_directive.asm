; invalid directive should not assemble

.ORIG x3000

    halt

    .INVALID

.END
