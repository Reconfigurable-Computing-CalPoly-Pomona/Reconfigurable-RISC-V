riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles -Trv32i_compliance.ld -o rv32i_compliance.elf rv32i_compliance.s
riscv64-unknown-elf-objdump -d rv32i_compliance.elf > rv32i_compliance.dump
riscv64-unknown-elf-objcopy -O ihex rv32i_compliance.elf rv32i_compliance.hex
python ../hex2coe.py rv32i_compliance.hex rv32i_compliance.coe
python ../hex2txt.py rv32i_compliance.hex rv32i_compliance.txt