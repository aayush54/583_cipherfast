; ModuleID = '<stdin>'
source_filename = "hello_world.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Hello World\0A\00", align 1
@seed = private unnamed_addr global [1 x i64] [i64 47]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = call i32 @__xorshift32(ptr @seed)
  %retval = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

define private i8 @__xorshift8(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  %2 = alloca i8, align 1
  store ptr %0, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr i8, ptr %3, i64 0
  %5 = load i8, ptr %4, align 1
  store i8 %5, ptr %2, align 1
  %6 = shl i8 %5, 13
  %7 = xor i8 %5, %6
  store i8 %7, ptr %2, align 1
  %8 = lshr i8 %7, 17
  %9 = xor i8 %7, %8
  store i8 %9, ptr %2, align 1
  %10 = shl i8 %9, 5
  %11 = xor i8 %9, %10
  store i8 %11, ptr %2, align 1
  %12 = load i8, ptr %2, align 1
  store i8 %12, ptr %4, align 1
  ret i8 %12
}

define private i16 @__xorshift16(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  %2 = alloca i16, align 2
  store ptr %0, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr i16, ptr %3, i64 0
  %5 = load i16, ptr %4, align 2
  store i16 %5, ptr %2, align 2
  %6 = shl i16 %5, 13
  %7 = xor i16 %5, %6
  store i16 %7, ptr %2, align 2
  %8 = lshr i16 %7, 17
  %9 = xor i16 %7, %8
  store i16 %9, ptr %2, align 2
  %10 = shl i16 %9, 5
  %11 = xor i16 %9, %10
  store i16 %11, ptr %2, align 2
  %12 = load i16, ptr %2, align 2
  store i16 %12, ptr %4, align 2
  ret i16 %12
}

define private i32 @__xorshift32(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  store ptr %0, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr i32, ptr %3, i64 0
  %5 = load i32, ptr %4, align 4
  store i32 %5, ptr %2, align 4
  %6 = shl i32 %5, 13
  %7 = xor i32 %5, %6
  store i32 %7, ptr %2, align 4
  %8 = lshr i32 %7, 17
  %9 = xor i32 %7, %8
  store i32 %9, ptr %2, align 4
  %10 = shl i32 %9, 5
  %11 = xor i32 %9, %10
  store i32 %11, ptr %2, align 4
  %12 = load i32, ptr %2, align 4
  store i32 %12, ptr %4, align 4
  ret i32 %12
}

define private i64 @__xorshift64(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  store ptr %0, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr i64, ptr %3, i64 0
  %5 = load i64, ptr %4, align 8
  store i64 %5, ptr %2, align 8
  %6 = shl i64 %5, 13
  %7 = xor i64 %5, %6
  store i64 %7, ptr %2, align 8
  %8 = lshr i64 %7, 17
  %9 = xor i64 %7, %8
  store i64 %9, ptr %2, align 8
  %10 = shl i64 %9, 5
  %11 = xor i64 %9, %10
  store i64 %11, ptr %2, align 8
  %12 = load i64, ptr %2, align 8
  store i64 %12, ptr %4, align 8
  ret i64 %12
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.6"}
