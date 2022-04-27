#!/bin/sh

/home/paco/sjasm/sjasm -s ./src/variables.asm

/home/paco/sjasm/sjasm -s ./src/vs.asm

rm -f ../bin/vs.rom

mv vs.rom bin
