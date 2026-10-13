; negative .BLKW argument should not assemble

.ORIG x3000

    halt

    .BLKW #-32767

.END
