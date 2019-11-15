#!/usr/bin/env bash
set -xeou pipefail
# build ants a la
# https://github.com/kaczmarj/ANTs-builds/blob/master/Dockerfile
# https://github.com/ANTsX/ANTs/wiki/Compiling-ANTs-on-Linux-and-Mac-OS
ANTSDIR=/opt/ni_tools/ANTs 

# need newer cmake
# wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.sh
# bash $(basename "$_")
export PATH="$(pwd)/cmake/cmake-3.13.4-Linux-x86_64/bin:$PATH"

[ ! -d ANTs-src/ ]  && git clone  https://github.com/stnava/ANTs.git ANTs-src
cd ANTs-src
[ -d build ] && rm -r build
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="$ANTSDIR" 
make -j4

cd ANTS-build

test -d $ANTSDIR && rm -r $_
make install
#cp -r bin/* ../Scipts/* $ANTSDIR/
