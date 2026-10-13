; .BLKW emitting past xFFFF should fail to assemble

.ORIG x3000

    halt

    .BLKW 0xCFFF ; override 1 word into io page memory

.END
