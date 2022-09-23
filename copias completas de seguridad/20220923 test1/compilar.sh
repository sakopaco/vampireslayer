#! /bin/bash

/opt/sjasm042c/sjasm -s /home/paco/Documentos/proyectos/vampireslayer/test1/src/variables.asm /home/paco/Documentos/proyectos/vampireslayer/test1/src/variables.dat

#esto lo pongo porque no va fino el sjasm y no pone las cosas donde le digo
mv /home/paco/Documentos/proyectos/vampireslayer/test1/variables.* /home/paco/Documentos/proyectos/vampireslayer/test1/src

/opt/sjasm042c/sjasm -s /home/paco/Documentos/proyectos/vampireslayer/test1/src/vs.asm

rm /home/paco/Documentos/proyectos/vampireslayer/test1/bin/vs.rom

mv /home/paco/Documentos/proyectos/vampireslayer/test1/vs.rom /home/paco/Documentos/proyectos/vampireslayer/test1/bin/

