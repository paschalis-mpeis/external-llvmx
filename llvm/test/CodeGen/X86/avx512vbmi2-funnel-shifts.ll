; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx512vbmi2 | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512vbmi2 -| FileCheck %s --check-prefixes=CHECK,X64

define <8 x i64> @avx512_funnel_shift_q_512(<8 x i64> %a0, <8 x i64> %a1) {
; X86-LABEL: avx512_funnel_shift_q_512:
; X86:       # %bb.0:
; X86-NEXT:    vpsllvq {{\.LCPI.*}}, %zmm0, %zmm0
; X86-NEXT:    vpsrlvq {{\.LCPI.*}}, %zmm1, %zmm1
; X86-NEXT:    vporq %zmm1, %zmm0, %zmm0
; X86-NEXT:    retl
;
; X64-LABEL: avx512_funnel_shift_q_512:
; X64:       # %bb.0:
; X64-NEXT:    vpsllvq {{.*}}(%rip), %zmm0, %zmm0
; X64-NEXT:    vpsrlvq {{.*}}(%rip), %zmm1, %zmm1
; X64-NEXT:    vporq %zmm1, %zmm0, %zmm0
; X64-NEXT:    retq
  %1 =  shl <8 x i64> %a0, <i64 31, i64 33, i64 31, i64 33, i64 31, i64 33, i64 31, i64 33>
  %2 = lshr <8 x i64> %a1, <i64 33, i64 31, i64 33, i64 31, i64 33, i64 31, i64 33, i64 31>
  %3 = or <8 x i64> %1, %2
  ret <8 x i64> %3
}

define <8 x i64> @avx512_funnel_shift_q_512_splat(<8 x i64> %a0, <8 x i64> %a1) {
; CHECK-LABEL: avx512_funnel_shift_q_512_splat:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsllq $31, %zmm0, %zmm0
; CHECK-NEXT:    vpsrlq $33, %zmm1, %zmm1
; CHECK-NEXT:    vporq %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 =  shl <8 x i64> %a0, <i64 31, i64 31, i64 31, i64 31, i64 31, i64 31, i64 31, i64 31>
  %2 = lshr <8 x i64> %a1, <i64 33, i64 33, i64 33, i64 33, i64 33, i64 33, i64 33, i64 33>
  %3 = or <8 x i64> %1, %2
  ret <8 x i64> %3
}

define <16 x i32> @avx512_funnel_shift_d_512(<16 x i32> %a0, <16 x i32> %a1) {
; X86-LABEL: avx512_funnel_shift_d_512:
; X86:       # %bb.0:
; X86-NEXT:    vpsllvd {{\.LCPI.*}}, %zmm0, %zmm0
; X86-NEXT:    vpsrlvd {{\.LCPI.*}}, %zmm1, %zmm1
; X86-NEXT:    vpord %zmm1, %zmm0, %zmm0
; X86-NEXT:    retl
;
; X64-LABEL: avx512_funnel_shift_d_512:
; X64:       # %bb.0:
; X64-NEXT:    vpsllvd {{.*}}(%rip), %zmm0, %zmm0
; X64-NEXT:    vpsrlvd {{.*}}(%rip), %zmm1, %zmm1
; X64-NEXT:    vpord %zmm1, %zmm0, %zmm0
; X64-NEXT:    retq
  %1 =  shl <16 x i32> %a0, <i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17>
  %2 = lshr <16 x i32> %a1, <i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15, i32 17, i32 15>
  %3 = or <16 x i32> %1, %2
  ret <16 x i32> %3
}

define <16 x i32> @avx512_funnel_shift_d_512_splat(<16 x i32> %a0, <16 x i32> %a1) {
; CHECK-LABEL: avx512_funnel_shift_d_512_splat:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpslld $15, %zmm0, %zmm0
; CHECK-NEXT:    vpsrld $17, %zmm1, %zmm1
; CHECK-NEXT:    vpord %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 =  shl <16 x i32> %a0, <i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15>
  %2 = lshr <16 x i32> %a1, <i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17>
  %3 = or <16 x i32> %1, %2
  ret <16 x i32> %3
}

define <32 x i16> @avx512_funnel_shift_w_512(<32 x i16> %a0, <32 x i16> %a1) {
; X86-LABEL: avx512_funnel_shift_w_512:
; X86:       # %bb.0:
; X86-NEXT:    vpsllvw {{\.LCPI.*}}, %zmm0, %zmm0
; X86-NEXT:    vpsrlvw {{\.LCPI.*}}, %zmm1, %zmm1
; X86-NEXT:    vporq %zmm1, %zmm0, %zmm0
; X86-NEXT:    retl
;
; X64-LABEL: avx512_funnel_shift_w_512:
; X64:       # %bb.0:
; X64-NEXT:    vpsllvw {{.*}}(%rip), %zmm0, %zmm0
; X64-NEXT:    vpsrlvw {{.*}}(%rip), %zmm1, %zmm1
; X64-NEXT:    vporq %zmm1, %zmm0, %zmm0
; X64-NEXT:    retq
  %1 =  shl <32 x i16> %a0, <i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9>
  %2 = lshr <32 x i16> %a1, <i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7, i16 9, i16 7>
  %3 = or <32 x i16> %1, %2
  ret <32 x i16> %3
}

define <32 x i16> @avx512_funnel_shift_w_512_splat(<32 x i16> %a0, <32 x i16> %a1) {
; CHECK-LABEL: avx512_funnel_shift_w_512_splat:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsllw $7, %zmm0, %zmm0
; CHECK-NEXT:    vpsrlw $9, %zmm1, %zmm1
; CHECK-NEXT:    vporq %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 =  shl <32 x i16> %a0, <i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7>
  %2 = lshr <32 x i16> %a1, <i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9, i16 9>
  %3 = or <32 x i16> %1, %2
  ret <32 x i16> %3
}


