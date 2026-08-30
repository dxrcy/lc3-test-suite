; sti PCoffset9 under -256 words should not assemble

.ORIG x3000

FarLabel .FILL #0
         .BLKW #255

    sti r0, FarLabel

.END
