#!/bin/bash
# PREREQUISITS: on external/llvm_prebuilt: ./compile.sh darwin_x86_64
# Copy tblgen from local externally compiled llvm tblgen, on host architecture (darwin in this case).
# It essentially copies the .inc files.
LLVM_VER=10.0.0
# LLVM_VER=9.0.1
HOST_ARCH=darwin_x86_64
dir="../../llvm_prebuilt"

function copy_tblgen() {
    from=$1
    replace_str=$from

    generated=$(find $cp_loc -name "*.inc")

    for file in $generated ;
    do 
        filename=$(basename $file)
        _t="${file/$replace_str/}" 
        _t="${_t/$filename/}" 
        folder=./include/tblgen/$_t

        echo "FOLDER: " $folder 
        mkdir -p $folder
        cp $file $folder
    done
}

cp_loc=$dir/src-$HOST_ARCH/llvm-$LLVM_VER.src/build/lib/
copy_tblgen $cp_loc "lib"

cp_loc=$dir/src-$HOST_ARCH/llvm-$LLVM_VER.src/build/include
copy_tblgen $cp_loc
