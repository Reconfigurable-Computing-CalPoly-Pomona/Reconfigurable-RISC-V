riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles -Tmedian_bench.ld -o median_bench.elf median_bench.s
riscv64-unknown-elf-objdump -d median_bench.elf > median_bench.dump
riscv64-unknown-elf-objcopy -O ihex median_bench.elf median_bench.hex
python ../hex2coe.py median_bench.hex median_bench.coe
python ../hex2txt.py median_bench.hex median_bench.txt