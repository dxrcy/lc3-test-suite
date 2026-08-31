; .BLKW emitting past xFE00 should fail to assemble

.ORIG x3000

    halt

    .BLKW xCE01 ; override 1 word into io page memory

.END
