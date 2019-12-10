#!/usr/bin/env bash
# expect already e.g.
#  apt install afni
# to handel depends.
# can use 
#  wget https://afni.nimh.nih.gov/pub/dist/bin/linux_openmp_64/@update.afni.binaries
# but probably need
#   Depends: neurodebian-popularity-contest, afni-common (= 16.2.07~dfsg.1-5~nd16.04+1), tcsh, gifsicle, libjpeg-progs, freeglut3, libc6 (>= 2.23), libexpat1 (>= 2.0.1), libf2c2, libgiftiio0, libgl1-mesa-glx | libgl1, libglib2.0-0 (>= 2.12.0), libglu1-mesa | libglu1, libglw1-mesa | libglw1, libgomp1 (>= 4.9), libgsl2, libgts-0.7-5 (>= 0.7.6), libice6 (>= 1:1.0.0), libnetcdf11 (>= 3.6.1), libnifti2, libsm6, libvolpack1 (>= 1.0b3), libx11-6, libxext6, libxm4 (>= 2.3.4), libxmhtml1.1 (>= 1.1.9), libxmu6, libxt6, zlib1g (>= 1:1.1.4)
#  Recommends: nifti-bin, bzip2, ffmpeg, netpbm, qhull-bin
source paths.bash # NI=/opt/ni_tools
@update.afni.binaries -d -bindir $NI/AFNI
