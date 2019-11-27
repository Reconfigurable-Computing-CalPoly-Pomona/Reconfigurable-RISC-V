# Benjamin Kueffler
# txt2ascii.py
# Converts a text with hex data to an ascii file
# Argument 1 - Text File to output (format XXXXXXXX in hex)
# Argument 2 - ASCII file to input (format x.xxe+x)

import sys

# Converts long to 32 bit signed
def toSigned32(n):
  n = n & 0xffffffff
  return (n ^ 0x80000000) - 0x80000000

f = open(sys.argv[1], "r")
w = open(sys.argv[2], "w")

# Go to each hex on every line and convert to ASCII
for x in f:

  # Convert hex to integer
  int_format = toSigned32(int(x, 16))
  exp_format = "{:.6E}".format(float(int_format))
  w.write(exp_format + '\n')

w.close();
f.close();
