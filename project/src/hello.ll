; ModuleID = 'hello.bc'
source_filename = "./toy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [46 x i8] c"Failed to allocate memory for dynamic array.\0A\00", align 1
@static_array = internal global [1000000 x i32] zeroinitializer, align 16
@static_variable = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [27 x i8] c"Static variable value: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %dynamic_array = alloca ptr, align 8
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %i19 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call noalias ptr @malloc(i64 noundef 4000000) #4
  store ptr %call, ptr %dynamic_array, align 8
  %0 = load ptr, ptr %dynamic_array, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @srand(i32 noundef 10) #5
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, ptr %i, align 4
  %cmp2 = icmp slt i32 %1, 1000000
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call3 = call i32 @rand() #5
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom
  store i32 %call3, ptr %arrayidx, align 4
  %call4 = call i32 @rand() #5
  %3 = load ptr, ptr %dynamic_array, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %4 to i64
  %arrayidx6 = getelementptr inbounds i32, ptr %3, i64 %idxprom5
  store i32 %call4, ptr %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc16, %for.end
  %6 = load i32, ptr %i7, align 4
  %cmp9 = icmp slt i32 %6, 1000000
  br i1 %cmp9, label %for.body10, label %for.end18

for.body10:                                       ; preds = %for.cond8
  %7 = load i32, ptr %i7, align 4
  %idxprom11 = sext i32 %7 to i64
  %arrayidx12 = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom11
  %8 = load i32, ptr %arrayidx12, align 4
  %inc13 = add nsw i32 %8, 1
  store i32 %inc13, ptr %arrayidx12, align 4
  %9 = load i32, ptr %i7, align 4
  %idxprom14 = sext i32 %9 to i64
  %arrayidx15 = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom14
  %10 = load i32, ptr %arrayidx15, align 4
  %11 = load i32, ptr @static_variable, align 4
  %add = add nsw i32 %11, %10
  store i32 %add, ptr @static_variable, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %for.body10
  %12 = load i32, ptr %i7, align 4
  %inc17 = add nsw i32 %12, 1
  store i32 %inc17, ptr %i7, align 4
  br label %for.cond8, !llvm.loop !8

for.end18:                                        ; preds = %for.cond8
  store i32 0, ptr %i19, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc29, %for.end18
  %13 = load i32, ptr %i19, align 4
  %cmp21 = icmp slt i32 %13, 1000000
  br i1 %cmp21, label %for.body22, label %for.end31

for.body22:                                       ; preds = %for.cond20
  %14 = load ptr, ptr %dynamic_array, align 8
  %15 = load i32, ptr %i19, align 4
  %idxprom23 = sext i32 %15 to i64
  %arrayidx24 = getelementptr inbounds i32, ptr %14, i64 %idxprom23
  %16 = load i32, ptr %arrayidx24, align 4
  %inc25 = add nsw i32 %16, 1
  store i32 %inc25, ptr %arrayidx24, align 4
  %17 = load ptr, ptr %dynamic_array, align 8
  %18 = load i32, ptr %i19, align 4
  %idxprom26 = sext i32 %18 to i64
  %arrayidx27 = getelementptr inbounds i32, ptr %17, i64 %idxprom26
  %19 = load i32, ptr %arrayidx27, align 4
  %20 = load i32, ptr @static_variable, align 4
  %add28 = add nsw i32 %20, %19
  store i32 %add28, ptr @static_variable, align 4
  br label %for.inc29

for.inc29:                                        ; preds = %for.body22
  %21 = load i32, ptr %i19, align 4
  %inc30 = add nsw i32 %21, 1
  store i32 %inc30, ptr %i19, align 4
  br label %for.cond20, !llvm.loop !9

for.end31:                                        ; preds = %for.cond20
  %22 = load i32, ptr @static_variable, align 4
  %call32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %22)
  %23 = load ptr, ptr %dynamic_array, align 8
  call void @free(ptr noundef %23) #5
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end31, %if.then
  %24 = load i32, ptr %retval, align 4
  ret i32 %24
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
