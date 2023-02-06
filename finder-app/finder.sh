#!/bin/sh
# Finder script for identifieng files
# Author: Mirko Julian Helbling

# Set the variables $filedir and searchstr
filedir=$1
searchstr=$2

echo $filedir
echo $searchstr


# Check if no argument is supplied
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 
fi

# Check if argument 1 is not empty
# $fildir must be an absolute path
if [ -z $filedir ]
  then
    echo "Argument 1 is empty"
    exit 1
    else
        if [ -d $filedir ]; then
            #echo "Directory does exist"
            echo ""
        else
            #echo "Directory does NOT exist!"
            exit 1
    fi
fi

# Check it argument 2 is not empty
if [ -z $searchstr ]
    then
    echo "Argument 2 is empty"
    exit 1
fi


NUMFILES=$(find $filedir  | wc -l)
NUMMATCH=$(find $filedir | grep -r $searchstr | wc -l)

echo "The number of files are ${NUMFILES} and the number of matching lines are ${NUMMATCH}"