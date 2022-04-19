#!/bin/sh

/home/paco/sjasm/sjasm -s ./src/variables.asm

/home/paco/sjasm/sjasm -s ./src/vs.asm

mv vs.rom bin
