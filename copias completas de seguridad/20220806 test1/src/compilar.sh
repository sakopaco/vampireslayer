#!/bin/sh

sjasm -s ./variables.asm variables.dat

sjasm -s ./vs.asm

rm -f ../bin/vs.rom

mv vs.rom ../bin/.
