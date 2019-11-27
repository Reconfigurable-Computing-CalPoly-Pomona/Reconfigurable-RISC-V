riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles -Tmedian.ld -o median.elf median.s
riscv64-unknown-elf-objdump -d median.elf > median.dump
riscv64-unknown-elf-objcopy -O ihex median.elf median.hex
python ../hex2coe.py median.hex median.coe
python ../hex2txt.py median.hex median.txt