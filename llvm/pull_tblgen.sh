#!/bin/bash
# Pulls tbgen generated files by a remotely compiled source
# PREREQUISITES: compile clang on remote

LLVM_VER=10.0.0
# LLVM_VER=9.0.1
IP=10.16.30.101
remote=paschalis@$IP

HOST_ARCH=darwin_x86_64
llvmDir=llvm_prebuilt
dir="../../llvm_prebuilt"

function pull_tblgen() {
    from=$1
    replace_str=$from

    echo "FROM: $from"

    generated=$(ssh $remote 'find ~/'$from' -name "*.inc"')

    # echo $generated

    # find remote home dir (we need to replace it when
    # calculating folders)
    remoteHomeDir=$(ssh $remote 'pwd')"/"
    echo "HOME: $remoteHomeDir"
    echo "Replace:  remoteHOME: $remoteHomeDir"
    echo "Replace: path in src: $replace_str"

    for file in $(echo $generated);
    do 
        filename=$(basename $file)
        _t=$file

        # replace: remote homedir, path, filename
        _t="${_t/$replace_str/}" 
        _t="${_t/$remoteHomeDir/}" 
        _t="${_t/$filename/}" 
        folder=./include/tblgen/$_t

        echo "Folder: " $file
        mkdir -p $folder
        scp $remote:$file $folder
    done
}

ARCH=arm
cp_loc=$llvmDir/src-$ARCH/llvm-$LLVM_VER.src/build/lib/
echo "LOC $cp_loc"
pull_tblgen $cp_loc

cp_loc=$llvmDir/src-$ARCH/llvm-$LLVM_VER.src/build/include
pull_tblgen $cp_loc
