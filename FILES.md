README.md

## Reserving X19/x20
llvm/lib/Target/AArch64/AArch64Subtarget.cpp
## Reserving R9
llvm/lib/Target/ARM/ARMSubtarget.h

## post-loop optimization
llvm/lib/Transforms/Utils/LoopUnroll.cpp

# SOONG Blueprint files added (build system):

## Blueprint of the whole external/llvmx module:
llvm/Android.bp
## Remaining blueprints:
llvm/lib/Analysis/Android.bp
llvm/lib/Android.bp
llvm/lib/AsmParser/Android.bp
llvm/lib/BinaryFormat/Android.bp
llvm/lib/Bitcode/Android.bp
llvm/lib/Bitcode/Reader/Android.bp
llvm/lib/Bitcode/Writer/Android.bp
llvm/lib/Bitstream/Reader/Android.bp
llvm/lib/CodeGen/Android.bp
llvm/lib/CodeGen/AsmPrinter/Android.bp
llvm/lib/CodeGen/GlobalISel/Android.bp
llvm/lib/CodeGen/MIRParser/Android.bp
llvm/lib/CodeGen/SelectionDAG/Android.bp
llvm/lib/DebugInfo/Android.bp
llvm/lib/DebugInfo/CodeView/Android.bp
llvm/lib/DebugInfo/DWARF/Android.bp
llvm/lib/DebugInfo/MSF/Android.bp
llvm/lib/DebugInfo/PDB/Android.bp
llvm/lib/DebugInfo/PDB/Native/Android.bp
llvm/lib/DebugInfo/Symbolize/Android.bp
llvm/lib/Demangle/Android.bp
llvm/lib/ExecutionEngine/Android.bp
llvm/lib/ExecutionEngine/Interpreter/Android.bp
llvm/lib/ExecutionEngine/JITLink/Android.bp
llvm/lib/ExecutionEngine/MCJIT/Android.bp
llvm/lib/ExecutionEngine/Orc/Android.bp
llvm/lib/ExecutionEngine/OrcError/Android.bp
llvm/lib/ExecutionEngine/RuntimeDyld/Android.bp
llvm/lib/ExecutionEngine/RuntimeDyld/Targets/Android.bp
llvm/lib/IR/Android.bp
llvm/lib/IRReader/Android.bp
llvm/lib/LTO/Android.bp
llvm/lib/Linker/Android.bp
llvm/lib/MC/Android.bp
llvm/lib/MC/MCDisassembler/Android.bp
llvm/lib/MC/MCParser/Android.bp
llvm/lib/Object/Android.bp
llvm/lib/ObjectYAML/Android.bp
llvm/lib/Option/Android.bp
llvm/lib/Passes/Android.bp
llvm/lib/ProfileData/Android.bp
llvm/lib/ProfileData/Coverage/Android.bp
llvm/lib/Remarks/Android.bp
llvm/lib/Support/Android.bp
llvm/lib/Support/Unix/Android.bp
llvm/lib/TableGen/Android.bp
llvm/lib/Target/AArch64/Android.bp
llvm/lib/Target/AArch64/AsmParser/Android.bp
llvm/lib/Target/AArch64/Disassembler/Android.bp
llvm/lib/Target/AArch64/MCTargetDesc/Android.bp
llvm/lib/Target/AArch64/TargetInfo/Android.bp
llvm/lib/Target/AArch64/Utils/Android.bp
llvm/lib/Target/ARM/Android.bp
llvm/lib/Target/ARM/AsmParser/Android.bp
llvm/lib/Target/ARM/Disassembler/Android.bp
llvm/lib/Target/ARM/MCTargetDesc/Android.bp
llvm/lib/Target/ARM/TargetInfo/Android.bp
llvm/lib/Target/ARM/Utils/Android.bp
llvm/lib/Target/Android.bp
llvm/lib/Target/Mips/Android.bp
llvm/lib/Target/Mips/AsmParser/Android.bp
llvm/lib/Target/Mips/Disassembler/Android.bp
llvm/lib/Target/Mips/MCTargetDesc/Android.bp
llvm/lib/Target/Mips/TargetInfo/Android.bp
llvm/lib/Target/X86/Android.bp
llvm/lib/Target/X86/AsmParser/Android.bp
llvm/lib/Target/X86/Disassembler/Android.bp
llvm/lib/Target/X86/MCTargetDesc/Android.bp
llvm/lib/Target/X86/TargetInfo/Android.bp
llvm/lib/Target/X86/Utils/Android.bp
llvm/lib/TextAPI/MachO/Android.bp
llvm/lib/ToolDrivers/llvm-lib/Android.bp
llvm/lib/Transforms/AggressiveInstCombine/Android.bp
llvm/lib/Transforms/Android.bp
llvm/lib/Transforms/CFGuard/Android.bp
llvm/lib/Transforms/Coroutines/Android.bp
llvm/lib/Transforms/Hello/Android.bp
llvm/lib/Transforms/IPO/Android.bp
llvm/lib/Transforms/InstCombine/Android.bp
llvm/lib/Transforms/Instrumentation/Android.bp
llvm/lib/Transforms/ObjCARC/Android.bp
llvm/lib/Transforms/Scalar/Android.bp
llvm/lib/Transforms/Utils/Android.bp
llvm/lib/Transforms/Vectorize/Android.bp
llvm/soong/Android.bp
llvm/tools/llc/Android.bp
llvm/tools/llvm-link/Android.bp
llvm/tools/opt/Android.bp
llvm/utils/FileCheck/Android.bp
llvm/utils/TableGen/Android.bp
llvm/utils/count/Android.bp
llvm/utils/not/Android.bp
llvm/utils/yaml-bench/Android.bp

# Some generated headers (tblgen) were implemented in go files
### This was the recommended for SOONG. It was too much of work,
### and since these files could have been generated from an external build,
#### some scripts were used. In any case, all these intermediate files are in the 
#### version control.
llvm/soong/llvm.go
llvm/soong/tblgen.go

#### some of the helper scripts that were used to externally generate and import tblgens and other .inc files
llvm/copy.sh
llvm/tblgen.sh
llvm/pull_includes.sh
llvm/pull_tblgen.sh

## Externally generated headers
llvm/include/
llvm/include/common/*
llvm/include/device/
llvm/include/device/arm/
llvm/include/device/arm64/
llvm/include/host/darwin_x86_64/
llvm/include/host/linux_x86_64/
llvm/include/tblgen/
llvm/lib/Support/Unix/ThreadLocal.inc
