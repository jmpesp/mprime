#!/bin/bash
set -ex

# apt pre-reqs
## if on ubuntu, may need universe
if grep Ubuntu /etc/lsb-release >/dev/null 2>/dev/null;
then
    sudo add-apt-repository universe
fi

sudo apt install -y \
    libudev-dev \
    libhwloc-dev \
    libgmp-dev \
    libcurl4-openssl-dev \
    clang \
    pkg-config

# compile UASM

[[ -e UASM ]] || git clone https://github.com/Terraspace/UASM
(
 cd UASM
 git checkout v2.52
 CFLAGS="-std=c99 -static" make CC="clang -fcommon" -f gccLinux64.mak
)

# compile gwnum

(
 cd gwnum
 make -f make64
)

# compile factor64.o

(
 cd prime95
 ./build.sh
 )

# compile linux64

(
 cd linux64
 make
)

