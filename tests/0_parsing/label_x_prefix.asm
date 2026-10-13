; labels beginning with X that are not valid hex literals must parse as labels

.ORIG x3000

    br Xx
    br Xxx
    br Xxxx

Xx   halt
Xxx  halt
Xxxx  halt

.END
