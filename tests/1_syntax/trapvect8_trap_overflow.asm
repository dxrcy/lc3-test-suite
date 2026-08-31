; trap vector over 255 should not assemble

.ORIG x3000

    halt

    trap #256

.END