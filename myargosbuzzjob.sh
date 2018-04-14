#!/usr/bin/env bash
#SBATCH -J jobname

# Stop execution after any error
set -e

# Cleanup function to be executed upon exit, for any reason
function cleanup() {
    rm -rf $WORKDIR
}



########################################
#
# Useful variables
#
########################################

# Your user name
# (Don't change this)
MYUSER=$(whoami)

# Path of the local storage on a node
# Use this to avoid sending data streams over the network
# (Don't change this)
LOCALDIR=/local

# ARGoS environment variables
# (Don't change this)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/argos3bundle/lib/argos3
export PATH=$PATH:$HOME/argos3bundle/bin

# Buzz environment variables
# (Don't change this)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/buzzbundle/lib
export PATH=$PATH:$HOME/buzzbundle/bin

# Folder where you want your data to be stored
# (Adapt this to your needs)
DATADIR=~/data



########################################
#
# Job-related variables
#
########################################

# Parameters related to this job
# (Use better names than these placeholders)
PARAM1=$1
PARAM2=$2

# Job id
# (Change this to reflect the above parameters)
THISJOB=${PARAM1}_${PARAM2}

# Job working directory
# (Don't change this)
WORKDIR=$LOCALDIR/$MYUSER/$THISJOB



########################################
#
# Job directory
#
########################################

# Create work dir from scratch, enter it
# (Don't change this)
rm -rf $WORKDIR && mkdir -p $WORKDIR && cd $WORKDIR

# Make sure you cleanup upon exit
# (Don't change this)
trap cleanup EXIT SIGINT SIGTERM



########################################
#
# Actual job logic
#
########################################

# Create .argos file from template in home directory
# (Change this to reflect the job parameters)
TEMPLATE=~/experiments/myexperiment.argos
sed -e "s|PARAM1|${PARAM1}|g" \
    -e "s|PARAM2|${PARAM2}|g" \
    $TEMPLATE > experiment.argos

# Run ARGoS
# (Usually there's no need to change this)
argos3 -c experiment.argos

# Transfer generated *.dat files into home directory
# (Adapt this to your data files)
cp -a *.dat $DATADIR
