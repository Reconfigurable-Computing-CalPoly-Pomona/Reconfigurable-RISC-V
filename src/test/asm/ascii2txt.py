# Benjamin Kueffler
# ascii2txt.py
# Converts a hex file to a text file for Xilinx FPGA memory loading (Using debug master)
# Argument 1 - ASCII file to input (format x.xxe+x)
# Argument 2 - Text File to output

import sys

def tohex(val, nbits):
  return hex((val + (1 << nbits)) % (1 << nbits))

f = open(sys.argv[1], "r")
w = open(sys.argv[2], "w")

# Go to each each exponentially formatted line and convert to a hex output
for x in f:
  # Convert exponential format to hex
  hex_format = tohex(int(float(x)), 32)
  # Remove 0x
  hex_format = hex_format.replace("0x","")
  # Pad with zeroes
  w.write(hex_format.zfill(8) + '\n')

w.close();
f.close();
