#!/bin/bash

# PREREQUISITES: compile llvm+clang on remote machine for arm and arm64
# INFO the remote machine must have built llvm/clang before
# INFO this script runned just once, to setup the following directories:
# device/arm
# device/arm64
# host/darwin_x86_64

LLVM_VERSION=10.0.0
#LLVM_VERSION=9.0.1
IP=10.16.30.101
remote=paschalis@$IP

# Enable or disable targets
# INFO arm contains common includes (from out/built directory..externally compiled)
# _ARM=1
# _ARM64=1
_LINUX=1
# _DARWIN=1

darm=device/arm
darm64=device/arm64
dlinux_x86_64=host/linux_x86_64
ddarwin_x86_64=host/darwin_x86_64

# incLlvm="include/llvm/"
LlvmConf="llvm/Config"
LlvmSupport="llvm/Support"

llvmDir=llvm_prebuilt

if [[ ! -z "$_ARM"  ]]; then
    arch=arm
    dir=$darm
    echo "pulling arm"
    mkdir -p include/$dir/llvm
    scp -r $remote:~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmConf include/$dir/llvm/
    scp -r $remote:~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmSupport include/$dir/llvm/
    echo "Pulling common includes"
    scp -r $remote:~/$llvmDir/out/$arch/include/llvm/ include/common/llvm
fi

if [[ ! -z "$_ARM64" ]]; then
    arch=arm64
    dir=$darm64
    echo "pulling arm64"
    mkdir -p include/$dir/llvm
    scp -r $remote:~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmConf include/$dir/llvm/
    scp -r $remote:~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmSupport include/$dir/llvm/
fi

if [[ ! -z "$_LINUX" ]]; then
    arch=linux_x86_64
    # echo "pulling linux"
    # mkdir -p include/$dlinux_x86_64
    # scp -r $remote:~/$llvmDir/out/linux_x86_64/include $dlinux_x86_64

    echo "copying linux"
    dir=$dlinux_x86_64
    mkdir -p include/$dir/llvm
    cp -r ~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmConf include/$dir/llvm/
    cp -r ~/$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmSupport include/$dir/llvm/
fi

if [[ ! -z "$_DARWIN" ]]; then
    arch=darwin_x86_64
    echo "copying darwin"
    dir=$ddarwin_x86_64
    mkdir -p include/$dir/llvm
    cp -r ../../$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmConf include/$dir/llvm/
    cp -r ../../$llvmDir/src-$arch/llvm-$LLVM_VERSION.src/build/include/$LlvmSupport include/$dir/llvm/
fi
