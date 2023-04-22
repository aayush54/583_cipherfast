; ModuleID = 'rng.c'
source_filename = "rng.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@statearr = dso_local global [2 x i64] [i64 10, i64 10], align 16
@.str = private unnamed_addr constant [3 x i8] c"%i\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xorshift32(ptr noundef %state) #0 {
entry:
  %state.addr = alloca ptr, align 8
  %x = alloca i32, align 4
  store ptr %state, ptr %state.addr, align 8
  %0 = load ptr, ptr %state.addr, align 8
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 0
  %1 = load i32, ptr %arrayidx, align 4
  store i32 %1, ptr %x, align 4
  %2 = load i32, ptr %x, align 4
  %shl = shl i32 %2, 13
  %3 = load i32, ptr %x, align 4
  %xor = xor i32 %3, %shl
  store i32 %xor, ptr %x, align 4
  %4 = load i32, ptr %x, align 4
  %shr = lshr i32 %4, 17
  %5 = load i32, ptr %x, align 4
  %xor1 = xor i32 %5, %shr
  store i32 %xor1, ptr %x, align 4
  %6 = load i32, ptr %x, align 4
  %shl2 = shl i32 %6, 5
  %7 = load i32, ptr %x, align 4
  %xor3 = xor i32 %7, %shl2
  store i32 %xor3, ptr %x, align 4
  %8 = load i32, ptr %x, align 4
  %9 = load ptr, ptr %state.addr, align 8
  %arrayidx4 = getelementptr inbounds i32, ptr %9, i64 0
  store i32 %8, ptr %arrayidx4, align 4
  %10 = load i32, ptr %x, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @xorshift64(ptr noundef %state) #0 {
entry:
  %state.addr = alloca ptr, align 8
  %x = alloca i64, align 8
  store ptr %state, ptr %state.addr, align 8
  %0 = load ptr, ptr %state.addr, align 8
  %arrayidx = getelementptr inbounds i64, ptr %0, i64 0
  %1 = load i64, ptr %arrayidx, align 8
  store i64 %1, ptr %x, align 8
  %2 = load i64, ptr %x, align 8
  %shl = shl i64 %2, 13
  %3 = load i64, ptr %x, align 8
  %xor = xor i64 %3, %shl
  store i64 %xor, ptr %x, align 8
  %4 = load i64, ptr %x, align 8
  %shr = lshr i64 %4, 7
  %5 = load i64, ptr %x, align 8
  %xor1 = xor i64 %5, %shr
  store i64 %xor1, ptr %x, align 8
  %6 = load i64, ptr %x, align 8
  %shl2 = shl i64 %6, 17
  %7 = load i64, ptr %x, align 8
  %xor3 = xor i64 %7, %shl2
  store i64 %xor3, ptr %x, align 8
  %8 = load i64, ptr %x, align 8
  %9 = load ptr, ptr %state.addr, align 8
  %arrayidx4 = getelementptr inbounds i64, ptr %9, i64 0
  store i64 %8, ptr %arrayidx4, align 8
  %10 = load i64, ptr %x, align 8
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i64 @xorshift64(ptr noundef @statearr)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %call)
  ret i32 1
}

declare i32 @printf(ptr noundef, ...) #1

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
