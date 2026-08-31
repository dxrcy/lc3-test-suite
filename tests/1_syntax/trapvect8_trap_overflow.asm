; trap vector over 255 should not assemble

.ORIG x3000

    trap #256

.END