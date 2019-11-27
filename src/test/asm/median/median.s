# Author : Ben Kueffler
# Date : 11/20/2019
# Description : Runs a median filter for benchmarking purposes

# Stores the address of the area of memory used to verify loads / stores
.equ MEM_BASE, 0x100000

# Area within the data memory used to status (I.E. pass/fail)
.equ STATUS_MEM, 0x100000

# Area within memory devoted to keeping the time (in cycles) (8-Bytes)
.equ TIME_MEM, 0x100004

# An invalid address on the bus, that is used to cause cache misses
.equ INVALID_BASE, 0x10000000

# The size of the cache, so it can be determined how much to load to cause a full cache dump
.equ CACHE_SIZE, 0x4000

# The number of bytes to perform a median filter on
.equ SAMPLES, 0x40

# The base address for the samples
.equ SAMPLE_BASE, 0x100100

# The base address for the output
.equ OUT_BASE, 0x101000

.globl _start

_start:

    # Store the test samples if applicable
    li x2, SAMPLE_BASE
    li x10, 4
    li x11, 6
    li x12, 7
    li x13, -1
    li x14, 59
    li x15, 30
    li x16, 58
    li x17, 58
    li x18, 59
    li x19, -30
    li x20, 4
    li x21, -22
    li x22, 40
    li x23, 33
    li x24, 0
    li x25, 102
    

    sw x10, 0(x2)
    sw x11, 4(x2)
    sw x12, 8(x2)
    sw x13, 12(x2)

    sw x14, 16(x2)
    sw x15, 20(x2)
    sw x16, 24(x2)
    sw x17, 28(x2)

    sw x18, 32(x2)
    sw x19, 36(x2)
    sw x20, 40(x2)
    sw x21, 44(x2)

    sw x22, 48(x2)
    sw x23, 52(x2)
    sw x24, 56(x2)
    sw x25, 60(x2)

    jal x1, median

    # The main test program is completed, record the number of cycles in designated memory space
    jal x26, timer

    # Attempt a cache flush to completely invalidate the cache and write everything to memory
    jal x26, cache_flush1

    # Verify

    # Store the verifcation samples if applicable
    li x10, 4
    li x11, 6
    li x12, 6
    li x13, 7

    li x14, 30
    li x15, 58
    li x16, 58
    li x17, 58

    li x18, 58
    li x19, 4
    li x20, -22
    li x21, 4

    li x22, 33
    li x23, 33
    li x24, 33
    li x25, 102
    
    li x4, (SAMPLES + OUT_BASE - 4)
    lw x26, -60(x4)
    bne x26, x10, fail
    lw x26, -56(x4)
    bne x26, x11, fail
    lw x26, -52(x4)
    bne x26, x12, fail
    lw x26, -48(x4)
    bne x26, x13, fail
    lw x26, -44(x4)
    bne x26, x14, fail
    lw x26, -40(x4)
    bne x26, x15, fail
    lw x26, -36(x4)
    bne x26, x16, fail
    lw x26, -32(x4)
    bne x26, x17, fail
    lw x26, -28(x4)
    bne x26, x18, fail
    lw x26, -24(x4)
    bne x26, x19, fail
    lw x26, -20(x4)
    bne x26, x20, fail
    lw x26, -16(x4)
    bne x26, x21, fail
    lw x26, -12(x4)
    bne x26, x22, fail
    lw x26, -8(x4)
    bne x26, x23, fail
    lw x26, -4(x4)
    bne x26, x24, fail
    lw x26, 0(x4)
    bne x26, x25, fail

    # Finish the test
    jal x26, pass

median:
    # Perform the median

    # Reg 10, 11, 12 are used to store the previous, current, and next samples
    li x4, (4 + OUT_BASE)
    li x5, (SAMPLES + OUT_BASE - 4)
    li x6, OUT_BASE

    # Write back the first sample, since it will not go through median filtering
    lw x11, 0(x2)
    lw x12, 4(x2)
    sw x11, 0(x6)
    li x2, (SAMPLE_BASE + 4)

median_shift:
    # Shift the registers (x10 (a) will become previous, x11 (b) will become present, x12 (c) will become future)
    mv x10, x11
    mv x11, x12

    # Load the future sample
    lw x12, 4(x2)

    # Perform the median algorithm

    # Check if a is greater than b
    bgt x10, x11, a_greater_b

    a_less_b:
        # A <= B

        # Check if b is greater than c
        bgt x11, x12, alb_b_greater_c

        alb_b_less_c:
            # C >= B >= A
            # B must be the median value
            sw x11, 0(x4)
            jal x0, med_incr

        alb_b_greater_c:
            # B > C && B > A
            # Check if a is greater than c
            bgt x10, x12, alb_bgc_a_greater_c

            alb_bgc_c_greater_a:
                # B > C >= A
                # Choose C
                sw x12, 0(x4)
                jal x0, med_incr

            alb_bgc_a_greater_c:
                # B > A > C
                # Choose A
                sw x10, 0(x4)
                jal x0, med_incr

    a_greater_b:
        # A > B

        # Check if b is greater than c
        bgt x11, x12, agb_b_greater_c

        agb_b_less_c:
            # A > B && C >= B

            # Check if a is greater than c
            bgt x10, x12, agb_cgb_a_greater_c

            agb_cgb_c_greater_a:
                # C > A > B
                # Choose A
                sw x10, 0(x4)
                jal x0, med_incr

            agb_cgb_a_greater_c:
                # A > C >= B
                # Choose C
                sw x12, 0(x4)
                jal x0, med_incr

        agb_b_greater_c:
            # A > B > C
            # B must be the median value
            sw x11, 0(x4)
            jal x0, med_incr

    med_incr:
        # Check to see if all but the last sample has been written
        addi x4, x4, 4
        addi x2, x2, 4
        blt x4, x5, median_shift

    # Write back the last sample, since it will not go through median filtering
    sw x12, 0(x4)

    # Return
    jalr x0, x1, 0

timer:
    # Store the time in the memory space
    rdcycleh x2
    rdcycle x1
    rdcycleh x3
    # If the LSB counter rolled over while reading the time, start again
    bne x3, x2, timer
    li x4, TIME_MEM
    sw x1, 0(x4)
    sw x2, 4(x4)
    jalr x0, x26, 0

cache_flush1:
    # Attempts to write back the cache to memory by causing a cache miss on all addresses
    li x9, CACHE_SIZE
    li x10, (INVALID_BASE + CACHE_SIZE + 4)
    li x11, INVALID_BASE

cache_flush2:
    lw x27, 0(x11)
    addi x11, x11, 4
    bne x10, x11, cache_flush2
    jalr x26, x26, 0

fail:
    li x31, 0xfa110002
    li x30, STATUS_MEM
    li x29, (STATUS_MEM + CACHE_SIZE)
    li x28, (STATUS_MEM + 2 * CACHE_SIZE)
    sw x31, 0(x30)

    # Flush cache to write the status to memory
    lw x0, 0(x29)
    lw x0, 0(x28)

    jal x1, fail

pass:
    li x31, 0xda550002
    li x30, STATUS_MEM
    li x29, (STATUS_MEM + CACHE_SIZE)
    li x28, (STATUS_MEM + 2 * CACHE_SIZE)
    sw x31, 0(x30)

    # Flush cache to write the status to memory
    lw x0, 0(x29)
    lw x0, 0(x28)

    jal x1, pass


