; out prints the low byte of r0

.ORIG x3000

    ld r0, CharT
    out
    ld r0, CharE
    out
    ld r0, CharS
    out
    ld r0, CharT
    out
    ld r0, Char_
    out
    ld r0, CharP
    out
    ld r0, CharA
    out
    ld r0, CharS
    out
    ld r0, CharS
    out
    ld r0, CharE
    out
    ld r0, CharD
    out

    halt

CharT .FILL xFF54 ; T
CharE .FILL xFF45 ; E
CharS .FILL xFF53 ; S
Char_ .FILL xFF5F ; _
CharP .FILL xFF50 ; P
CharA .FILL xFF41 ; A
CharD .FILL xFF44 ; D

.END
