; everything is case insensitive

.ORig X3000

    aNd R2, r2, #0
    Add R1, r2, #5
    anD R1, R1, #3
    add r1, R1, #-1
    BRnP Fail

    leA r0, PassMsg
    Puts
    HalT

Fail
    Lea R0, FailMsg
    pUTS
    HaLT

PassMsg .strIngZ "TEST_PASSED"
FailMsg .sTrIngz "TEST_FAILED"

.eNd
