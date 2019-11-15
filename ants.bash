#!/usr/bin/env bash
set -xeou pipefail
# build ants a la
# https://github.com/kaczmarj/ANTs-builds/blob/master/Dockerfile
ANTSDIR=/opt/ni_tools/ANTs 

# need newer cmake
# wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.sh
export PATH="$(pwd)/cmake/cmake-3.13.4-Linux-x86_64/bin:$PATH"

[ ! -d ANTs-src/ ]  && git clone  https://github.com/stnava/ANTs.git ANTs-src
cd ANTs-src
[ -d build ] && rm -r build
mkdir build
cd build
cmake ..
make -j4

test -d $ANTSDIR && rm -r $_
mkdir $ANTSDIR
cp -r bin/* ../Scipts/* $ANTSDIR/
