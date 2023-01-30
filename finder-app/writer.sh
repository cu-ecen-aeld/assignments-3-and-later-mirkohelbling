#!/bin/sh
# Finder script for identifieng files
# Author: Mirko Julian Helbling

# Set the variables $filedir and searchstr
writefile=$1
writestr=$2

# Check if no argument is supplied
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

# Check if the the path/file argument is given
if [ -z $writefile ]
  then
    echo "Argument 1 is empty"
    exit 1
  else
  # Check if the "to be written" argument given
    if [ -z $writestr ]
        then
            echo "Argument 2 is empty"
            exit 1
    # Create the needed directories and the file 
    else
        $(mkdir -p "$(dirname $writefile )" && touch $writefile)
        # Write the "to be written" value in the file
        $(echo $writestr > $writefile)
        if [ -f $writefile ]
            then
                #echo "File is succesfull created!"
                exit 1
                #echo "File is not created"
        fi    
   
    fi
fi
  