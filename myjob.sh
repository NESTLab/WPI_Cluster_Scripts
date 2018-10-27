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

# Execute job
# (Your commands go here)

# Transfer generated *.dat files into home directory
# (Adapt this to your data files)
cp -a *.dat $DATADIR
