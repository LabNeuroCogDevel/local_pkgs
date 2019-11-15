export PYTHONPATH=/opt/ni_tools/python/userbase
export PYTHONUSERBASE=/opt/ni_tools/python/userbase
export FSLDIR="/opt/ni_tools/fsl_6"
export PATH="/opt/ni_tools/ANTs:$FSLDIR/bin:/opt/ni_tools/fmri_processing_scripts:/opt/ni_tools/preproc_pipelines:$PYTHONPATH/bin:$PATH:"
source $FSLDIR/etc/fslconf/fsl.sh

# afni help if we have it
test -f "`apsearch -afni_help_dir`/all_progs.COMP.bash" && . $_

