#!/usr/bin/env bash
set -euo pipefail
trap 'e=$?; [ $e -ne 0 ] && echo "$0 exited in error"' EXIT
set -x
#
# install dsistudio
#  20191210WF  into local_pkgs
#  20180919WF init (readme)
#
# ALTENATIVE:
#  docker run -ti --rm --net host -v $HOME/.Xauthority:/root/.Xauthority:rw  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v $PWD:/data -v /Volumes:/Volumes manishka/dsi-studio-docker:latest


# DTI Studio Install
# http://dsi-studio.labsolver.org/dsi-studio-download/compile-dsi-studio-on-windows-mac-linux

## working version
# ds: 3c5d4c311dbc8f066576f4f520a2c1901a3e1650 (dec 7 2016)
# tipl: 2de038e6aa9f5b91441adc65bd6fb1d06b3cd99b (nov 22 2016)

APTDEPS=(libqt5charts5-dev libqt5opengl5-dev qt5-qmake qt5-default git libboost-all-dev zlib1g zlib1g-dev)
YUMDEPS=(qt qt-devel boost boost-dev zlib zlib-dev)


# either update or new directory
[ $# -eq 0 ] || [[ ! $1 =~ today|update ]] && { echo -e "USAGE: $0 today|update"; exit 1; }
[ "$1" == "today" ] && ext=-$(date +%Y%m%d) || ext=""

# 
! test -d /opt/ni_tools/dsistudio$ext && mkdir $_
cd $_
[ ! -d src ] && git clone -b master git://github.com/frankyeh/DSI-Studio.git src 
cd src
git pull # update if we didn't clone



[ ! -d image ] && 
   git clone  https://github.com/frankyeh/TIPL image ||
   (cd image; git pull)

# 20191210 - no longer image but tipl
[ ! -r tipl ] && ln -s image tipl

# or get from zip
# wget https://github.com/frankyeh/TIPL/archive/master.zip
# unzip -d timpzip/
# mv tmpzip/TIPL-master/ image
# rmdir tmpzip
cd ..
[ -d build ] && mv build{,_$(stat -c "%y" build|cut -f1 -d' ')}

mkdir build
cd build
qmake ../src/dsi_studio.pro -spec linux-g++ && make
make

ln -s ../HCP842_QA.nii.gz ./
