#!/bin/bash

export PATH="${PWD}/../UASM/GccUnixR/:${PATH}"
uasm64 \
    -c -DX86_64 -DLINUX64 -DARCH=FMA3 \
    -I../gwnum -win64 -archAVX -elf64 \
    -Fo ../linux64/factor64.o factor64.asm
