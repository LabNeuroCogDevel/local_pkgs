#!/usr/bin/env bash
source paths.bash
wget https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
tar -xzvf freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz 
mv freesurfer $NI
rm freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
