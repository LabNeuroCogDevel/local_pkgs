export NI=/opt/ni_tools
export PYTHONPATH=$NI/python/userbase
export PYTHONUSERBASE=$NI/python/userbase
export FSLDIR="$NI/fsl_6"
export PATH="$NI/ANTs/bin:$NI/AFNI:$FSLDIR/bin:$NI/fmri_processing_scripts:$NI/preproc_pipelines:$NI/hub:$PYTHONPATH/bin:$PATH"
source $FSLDIR/etc/fslconf/fsl.sh

# afni help if we have it
test -f "`apsearch -afni_help_dir`/all_progs.COMP.bash" && . $_

# dsistudio from docker container with x11/window forwarding
dsistudio_docker() { 
   # on local machine, allow docker to connect to xorg by running:
   # `host +x`
   local X11opts="--net host -e DISPLAY=$DISPLAY  -v $HOME/.Xauthority:/root/.Xauthority:rw  -v /tmp/.X11-unix:/tmp/.X11-unix"
   local diropts="-v $PWD:/data -v /Volumes:/Volumes"
   local container="manishka/dsi-studio-docker:latest" 
   docker run -ti --rm  $X11opts $diropts $container $@
}
