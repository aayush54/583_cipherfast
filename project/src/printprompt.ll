; ModuleID = 'printprompt.bc'
source_filename = "printprompt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"intermidate result: %ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @printPrompt(i64 noundef %numIn) #0 {
entry:
  %numIn.addr = alloca i64, align 8
  %numOut = alloca i64, align 8
  store i64 %numIn, ptr %numIn.addr, align 8
  %0 = load i64, ptr %numIn.addr, align 8
  %mul = mul nsw i64 %0, 29
  %rem = srem i64 %mul, 253
  store i64 %rem, ptr %numOut, align 8
  %1 = load i64, ptr %numOut, align 8
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %1)
  %2 = load i64, ptr %numOut, align 8
  %conv = trunc i64 %2 to i32
  ret i32 %conv
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
