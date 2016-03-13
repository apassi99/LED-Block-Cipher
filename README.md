# LED-Block-Cipher

## Compiling

1) arm-linux-gnueabi-g++ -static main.cpp -o main
2) arm-linux-gnueabi-gcc main.c -o main

## Running on Gem5

build/ARM/gem5.opt --stats-file=out.txt configs/example/se.py -c main
