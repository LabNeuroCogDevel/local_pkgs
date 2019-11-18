export PYTHONPATH=/opt/ni_tools/python/userbase
export PYTHONUSERBASE=/opt/ni_tools/python/userbase
export FSLDIR="/opt/ni_tools/fsl_6"
NI=/opt/ni_tools
export PATH="$NI/ANTs/bin:$NI/AFNI:$FSLDIR/bin:$NI/fmri_processing_scripts:$NI/preproc_pipelines:$NI/hub:$PYTHONPATH/bin:$PATH"
source $FSLDIR/etc/fslconf/fsl.sh

# afni help if we have it
test -f "`apsearch -afni_help_dir`/all_progs.COMP.bash" && . $_

