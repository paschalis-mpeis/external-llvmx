#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file with changes>"
    exit 1
fi
file=$1

if [ ! -f $file ]; then
    echo "File does not exist: $file"
    exit 1
fi

while read line; do
  echo "LINE: $line"
  extfile=$line
  extdir=$(dirname "${extfile}")
  dir=${extdir#*/}
  echo "Directory: $dir"
  if [ ! -d $dir ]; then
      echo "Does NOT exist: $line"
      #echo "DIR: $dir"
      #exit 1
  fi

  echo "Copying to: $dir"
  mv ../../$extfile $dir
done <$file
