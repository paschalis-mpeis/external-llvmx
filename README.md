# external/llvmx
LLVM sources already exist as an external project on Android (external/llvm), at version 3.6.
This is problematic:
- very old version, with limited capabilities
- there is no way to make it compile with c++11/ART (runtime and compiler).
- it is used as an external library to other components of AOSP, so it cannot be removed or updated


The workaround for this is to create another external project: `external/llvmx`, which is based on llvm10.
It does not conflict with the other llvm library, and it can generate `libLLVM.so`.
This work well with AOSP as it is compiled with the SOONG toolchain
(compiling `libLLVM.so` externally won't)

Other generated tools:
- llc
- opt
- llvm-link


# Other notes
## pull_includes.sh:
This was invoked once to fetch the generated headers from a remote machine:
./device (scp from remote cross-compiled sources)  
./device/arm  
./device/arm64  

./host  
./host/darwin_x86_64 (cp from local machine - macbook)  


## pull_tlbgen.sh:
This was invoked once to copy the tblgen inc headers for:  
./include/tblgen  

Those aux headers had to be created with custom targets through the SOONG build system, i.e., by modifying:  
./Android.bp  
./soong/tblgen.go  

This was a lot of work, so they were generated and imported (as pre-builts) from an external compilation.
