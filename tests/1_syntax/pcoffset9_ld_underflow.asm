; ld PCoffset9 under -256 words should not assemble

.ORIG x3000

    halt

FarLabel .FILL #0
         .BLKW #255

    ld r0, FarLabel

.END
