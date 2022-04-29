#!/bin/sh

/home/paco/sjasm/sjasm -s ./variables.asm

/home/paco/sjasm/sjasm -s ./vs.asm

rm -f ../bin/vs.rom

mv vs.rom bin
