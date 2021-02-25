; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt -S -passes='attributor' -aa-pipeline='basic-aa' -attributor-disable=false -attributor-max-iterations-verify -attributor-max-iterations=2 < %s | FileCheck %s

target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

define internal void @add({i32, i32}* %this, i32* sret %r) {
; CHECK-LABEL: define {{[^@]+}}@add
; CHECK-SAME: ({ i32, i32 }* noalias nocapture nofree nonnull readonly align 8 dereferenceable(8) [[THIS:%.*]], i32* noalias nocapture nofree nonnull sret writeonly align 4 dereferenceable(4) [[R:%.*]])
; CHECK-NEXT:    [[AP:%.*]] = getelementptr { i32, i32 }, { i32, i32 }* [[THIS]], i32 0, i32 0
; CHECK-NEXT:    [[BP:%.*]] = getelementptr { i32, i32 }, { i32, i32 }* [[THIS]], i32 0, i32 1
; CHECK-NEXT:    [[A:%.*]] = load i32, i32* [[AP]], align 8
; CHECK-NEXT:    [[B:%.*]] = load i32, i32* [[BP]]
; CHECK-NEXT:    [[AB:%.*]] = add i32 [[A]], [[B]]
; CHECK-NEXT:    store i32 [[AB]], i32* [[R]], align 4
; CHECK-NEXT:    ret void
;
  %ap = getelementptr {i32, i32}, {i32, i32}* %this, i32 0, i32 0
  %bp = getelementptr {i32, i32}, {i32, i32}* %this, i32 0, i32 1
  %a = load i32, i32* %ap
  %b = load i32, i32* %bp
  %ab = add i32 %a, %b
  store i32 %ab, i32* %r
  ret void
}

define void @f() {
; CHECK-LABEL: define {{[^@]+}}@f()
; CHECK-NEXT:    [[R:%.*]] = alloca i32
; CHECK-NEXT:    [[PAIR:%.*]] = alloca { i32, i32 }
; CHECK-NEXT:    call void @add({ i32, i32 }* noalias nocapture nofree nonnull readonly align 8 dereferenceable(8) [[PAIR]], i32* noalias nocapture nofree nonnull sret writeonly align 4 dereferenceable(4) [[R]])
; CHECK-NEXT:    ret void
;
  %r = alloca i32
  %pair = alloca {i32, i32}

  call void @add({i32, i32}* %pair, i32* sret %r)
  ret void
}
