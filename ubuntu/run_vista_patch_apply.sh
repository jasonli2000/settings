#! /bin/sh

### Scripts to run the KIDSPatchSeqenceApply.py ####

### check the up the environment first ###
result=`which gtm` # check to see if gtm is accessible directly
echo "$result"
if [ -z "$result" ]; then
  echo "gtm is not found!"
  if [ -z "$gtm_dist" ]; then
    echo "gtm_dist is not defined!"
    . ~/.gtm_env
  fi
fi

### define some the constants ###
VISTA_PATCH_REPO="$HOME/git/VistA-Patches"
PATCH_DIR="$VISTA_PATCH_REPO/Packages/"
SCRIPT_NAME="$VISTA_PATCH_REPO/Scripts/KIDSPatchSequenceApply.py"
LOG_DIR=/tmp/log
SYSTEM=2 # for GTM
if [ ! -e $LOG_DIR ]; then
  mkdir $LOG_DIR
fi

if [ $# -gt 1 ]; then
  python $SCRIPT_NAME -p $PATCH_DIR -l $LOG_DIR -S $SYSTEM -i
else
  python $SCRIPT_NAME -p $PATCH_DIR -l $LOG_DIR -S $SYSTEM
fi

rcode=$?
if [ $rcode -eq 0 ]; then
  echo "###SUCCESS###"
else
  echo "###FAILED###"
fi
