; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt -S -passes=attributor -aa-pipeline='basic-aa' -attributor-disable=false -attributor-max-iterations-verify -attributor-max-iterations=1 < %s | FileCheck %s

; See PR26774

define i32 @baz() {
; CHECK-LABEL: define {{[^@]+}}@baz()
; CHECK-NEXT:    ret i32 10
;
  ret i32 10
}

; We can const-prop @baz's return value *into* @foo, but cannot
; constprop @foo's return value into bar.

define linkonce_odr i32 @foo() {
; CHECK-LABEL: define {{[^@]+}}@foo()
; CHECK-NEXT:    [[VAL:%.*]] = call i32 @baz()
; CHECK-NEXT:    ret i32 10
;

  %val = call i32 @baz()
  ret i32 %val
}

define i32 @bar() {
; CHECK-LABEL: define {{[^@]+}}@bar()
; CHECK-NEXT:    [[VAL:%.*]] = call i32 @foo()
; CHECK-NEXT:    ret i32 [[VAL]]
;

  %val = call i32 @foo()
  ret i32 %val
}
