# Author : Ben Kueffler
# Date : 11/1/2019
# Description : Verifies RV32I functionality by testing each
# RISC V RV32I instruction and verifying result.

# Stores the address of the area of memory used to verify loads / stores
.equ MEM_BASE, 0x100000
# Area within the data memory used to status (I.E. pass/fail)
.equ STATUS_MEM, 0x101f00
# Area within memory devoted to keeping the time (in cycles) (8-Bytes)
.equ TIME_MEM, 0x101ff8

# An invalid address on the bus, that is used to cause cache misses
.equ INVALID_BASE, 0xf00000

# The size of the cache, so it can be determined how much to load to cause a full cache dump
.equ CACHE_SIZE, 0x4000

.globl _start

_start:

    # Verify the Arithmetic RV32I instructions (ADD, ADDI, SUB, LUI, AUIPC)

    # Load the expected value for this test
    lui x31, 8
    lui x30, 7

    li x8, MEM_BASE
    sw x31, 0(x8)

    # Counter is equal to # of instructions before AUIPC to accurately 
    li x29, (0xdead000 + 9 * 4)
    lui x12, 0xFFFFF
    lui x11, 1
    addi x10, x0, 8

    # Add upper immediate to PC and store, note that if instructions come before this, the check value must be updated
    auipc x13, 0xdead
    bne x13, x29, fail

    # Sub Test
    sub x29, x31, x30

    # Check that subtraction went through, also that branches are working
    bne x29, x11, fail

    # Negative number test
    sub x28, x30, x31
    bne x28, x12, fail

    # Add instructions w/ hazards
    addi x0, x0, 3
    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    add  x4, x1, x4
    add  x4, x3, x4
    bne  x4, x10, fail

    # Logical Test
    li x4, 4
    li x31, 6
    xor x5, x2, x4
    bne x31, x5, fail
    xori x6, x2, 0x12
    li x30, 0x10
    bne x30, x6, fail
    or x7, x2, x4
    li x29, 0x6
    li x28, 0x23
    bne x29, x7, fail
    ori x8, x3, 0x20
    bne x28, x8, fail
    and x9, x3, x1
    li x27, 1
    bne x27, x9, fail
    andi x10, x3, 0xF
    li x26, 3
    bne x26, x10, fail

    # Shift test

    # Shift left logical
    li x5, 0x35a
    li x31, 0x35a0
    sll x11, x5, x4
    bne x31, x11, fail
    slli x12, x5, 30
    lui x30, 0x80000
    bne x30, x12, fail
    slli x13, x5, 0
    bne x5, x13, fail

    # Shift Right logical
    li x5, 0x35a
    li x31, 0x35
    srl x11, x5, x4
    bne x31, x11, fail
    srli x12, x30, 31
    bne x1, x12, fail
    srli x13, x30, 0
    bne x30, x13, fail

    # Shift Right Arithmetic
    li x5, 0x8
    lui x27, 0xF0000
    sra x11, x30, x3
    bne x11, x27, fail
    srai x12, x30, 3
    bne x27, x11, fail
    srai x13, x5, 4
    bne x0, x13, fail

    # Comparison
    sub x5, x0, x4
    sub x6, x1, x4
    li x7, 7
    slt x14, x5, x6
    bne x1, x14, fail
    slt x15, x6, x5
    bne x15, x0, fail
    slt x16, x6, x1
    bne x16, x1, fail

    # Compare Immediate
    slti x17, x5, -1
    bne x1, x17, fail
    slti x18, x6, -3
    bne x18, x0, fail
    slti x19, x6, 4
    bne x19, x1, fail

    # Unsigned Compare
    lui x12, 0xFFFFF
    sltu x20, x4, x12
    bne x20, x1, fail
    sltu x20, x12, x4
    bne x20, x0, fail

    # Unsigned Immediate Compare
    sltiu x21, x5, 0x80
    bne x21, x0, fail
    sltiu x22, x12, 0x5
    bne x22, x0, fail
    sltiu x23, x21, 0x7ff
    bne x23, x1, fail

    # Verify Jumps
    jal x10, jal0

    # Check to see if the jump was executed
    bne x11, x3, fail

    jal x13, jal1

    # Counters, these will be difficult to verify

    # Read number of cycles since the processor began
    rdcycle x20
    rdcycleh x21

    # Read the time (In microseconds, set at the processor level)
    rdtime x22
    rdtimeh x23

    # Read the number of cycles in the hardware thread
    rdinstret x24
    rdinstreth x25

    # Verify branches
    li x10, 4
    beq x4, x10, beq0

br_return:
    # Store data to verify
    li x10, 0x76543210
    li x11, 0xfedcba98
    li x12, 0x7654ba98
    li x13, 0x76543298
    li x14, 0x54ba
    li x15, 0x76
    li x16, 0x01234567
    li x17, 0xdeadbeef
    li x8, MEM_BASE
    addi x9, x8, 0x108
    sw x10, 0(x8)
    sw x10, 4(x8)
    sw x10, 8(x8)
    sh x11, 4(x8)
    sb x11, 8(x8)
    lw x20, 0(x8)

    bne x10, x20, fail

    lw x21, 4(x8)
    lw x22, 8(x8)
    bne x12, x21, fail
    bne x13, x22, fail

    # Attempt unaligned half-word load
    lh x23, 5(x8)
    bne x14, x23, fail
    # Attempt byte load
    lb x24, 11(x8)
    bne x15, x24, fail

    sw x16, 4(x9)
    sw x17, 8(x9)

    lw x24, 4(x9)
    lw x25, 8(x9)
    addi x26, x24, 0

    bne x16, x24, fail
    bne x17, x25, fail
    bne x16, x26, fail

    # Store to memory before the cache flush so it can be verified that this info goes to memory
    sw x16, 0(x8)
    sw x17, 4(x8)
    sw x10, 36(x8)
    sw x11, 40(x8)

    # The main test program is completed, record the number of cycles in designated memory space
    jal x26, timer

    # Attempt a cache flush to completely invalidate the cache and write everything to memory
    jal x26, cache_flush1

    # Verify that the data is written back into memory
    li x10, 0x76543210
    li x11, 0xfedcba98
    lw x20, 0(x8)
    lw x21, 4(x8)
    lw x22, 36(x8)
    lw x23, 40(x8)
    
    bne x20, x16, fail
    bne x21, x17, fail
    bne x22, x10, fail
    bne x11, x23, fail

    # Finish the test
    jal x26, pass

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

jal0:
    # Throw in an instruction
    add x11, x1, x2

    # Return
    jalr x12, x10, 0

jal1:
    # Return without any instructions in between
    jalr x14, x13, 0

beq0:
    # Verify BEQ returns negative successfully
    beq x4, x3, fail
    # Check BNE
    bne x3, x2, bne0
    jal x31, fail

bne0:
    # Check branch less than
    li x11, -1
    blt x11, x1, blt0
    jal x31, fail

blt0:
    # Verify BLT returns negative successfully
    blt x11, x11, fail
    bge x11, x11, bge0
    jal x31, fail

bge0:
    # Verify BGE returns negative successfully
    bge x11, x0, fail
    bltu x0, x11, bltu0
    jal x31, fail

bltu0:
    # Verify BLTU returns negative successfully
    bltu x11, x1, fail
    bgeu x11, x1, bgeu0
    jal x31, fail

bgeu0:
    # Verify BGEU returns negative successfully
    bgeu x3, x4, fail
    jal x26, br_return

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
    li x31, 0xfa110001
    li x30, STATUS_MEM
    li x29, (STATUS_MEM + CACHE_SIZE)
    li x28, (STATUS_MEM + 2 * CACHE_SIZE)
    sw x31, 0(x30)

    # Flush cache to write the status to memory
    sw x0, 0(x29)
    sw x0, 0(x28)

    jal x1, fail

pass:
    li x31, 0xda550001
    li x30, STATUS_MEM
    li x29, (STATUS_MEM + CACHE_SIZE)
    li x28, (STATUS_MEM + 2 * CACHE_SIZE)
    sw x31, 0(x30)

    # Flush cache to write the status to memory
    sw x0, 0(x29)
    sw x0, 0(x28)

    jal x1, pass
    jal x0, done

done:
    jal x0, done

