# Benjamin Kueffler
# hex2txt.py
# Converts a hex file to a text file for Xilinx FPGA memory loading (Using debug master)
# Argument 1 - Hex file to input
# Argument 2 - Text File to output

# Hex format:
# Byte 0 indicates the number of bytes
# Bytes (1:2) indicate the starting address
# Byte 3 indicates the type (00 - data, 01 - EoF, 02 - offset)
# Bytes (4:varies) indicate the data
# The last byte is a checksum

import sys

f = open(sys.argv[1], "r")
w = open(sys.argv[2], "w")

# Go to each hex on every line and convert to 32-bit wide COE file format
for x in f:

  # Check if it's data
  if (x[8] == '0'):
    # Determine the amount of data
    llen = int(x[1] + x[2], 16)
    for l in range(int(llen / 4)):
      for i in range(16 + 8 * l, 8 + 8 * l, -2):
        w.write(x[i - 1] + x[i])
      w.write('\n')

w.close();
f.close();
