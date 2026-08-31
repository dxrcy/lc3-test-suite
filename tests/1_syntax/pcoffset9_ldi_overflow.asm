; ldi PCoffset9 over 255 words should not assemble

.ORIG x3000

    halt

    ldi r0, FarLabel

         .BLKW #256
FarLabel .FILL #0

.END
