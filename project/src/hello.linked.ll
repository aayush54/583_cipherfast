; ModuleID = 'hello.linked.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [46 x i8] c"Failed to allocate memory for dynamic array.\0A\00", align 1
@static_array = internal global [1000000 x i32] zeroinitializer, align 16
@static_variable = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [27 x i8] c"Static variable value: %d\0A\00", align 1
@seed = private unnamed_addr global [1 x i64] [i64 47]
@.str.2 = private unnamed_addr constant [25 x i8] c"intermidate result: %ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %retval = alloca i32, align 4
  %dynamic_array = alloca ptr, align 8
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %i19 = alloca i32, align 4
  %9 = call i32 @__xorshift32(ptr @seed)
  store i32 %9, ptr %0, align 4
  %xor = xor i32 %9, 0
  store i32 %xor, ptr %retval, align 4
  %10 = call i32 @printPromt(i64 31)
  %call = call noalias ptr @malloc(i64 noundef 4000000) #4
  store ptr %call, ptr %dynamic_array, align 8
  %11 = load ptr, ptr %dynamic_array, align 8
  %cmp = icmp eq ptr %11, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %12 = call i32 @__xorshift32(ptr @seed)
  store i32 %12, ptr %0, align 4
  %xor1 = xor i32 %12, 1
  store i32 %xor1, ptr %retval, align 4
  %13 = call i32 @printPromt(i64 31)
  br label %return

if.end:                                           ; preds = %entry
  call void @srand(i32 noundef 10) #5
  %14 = call i32 @__xorshift32(ptr @seed)
  store i32 %14, ptr %1, align 4
  %xor2 = xor i32 %14, 0
  store i32 %xor2, ptr %i, align 4
  %15 = call i32 @printPromt(i64 31)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %16 = load i32, ptr %1, align 4
  %17 = load i32, ptr %i, align 4
  %xor3 = xor i32 %16, %17
  %cmp2 = icmp slt i32 %xor3, 1000000
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call3 = call i32 @rand() #5
  %18 = load i32, ptr %1, align 4
  %19 = load i32, ptr %i, align 4
  %xor4 = xor i32 %18, %19
  %idxprom = sext i32 %xor4 to i64
  %arrayidx = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom
  %20 = call i32 @__xorshift32(ptr @seed)
  store i32 %20, ptr %2, align 4
  %xor5 = xor i32 %20, %call3
  store i32 %xor5, ptr %arrayidx, align 4
  %21 = call i32 @printPromt(i64 31)
  %call4 = call i32 @rand() #5
  %22 = load ptr, ptr %dynamic_array, align 8
  %23 = load i32, ptr %1, align 4
  %24 = load i32, ptr %i, align 4
  %xor6 = xor i32 %23, %24
  %idxprom5 = sext i32 %xor6 to i64
  %arrayidx6 = getelementptr inbounds i32, ptr %22, i64 %idxprom5
  %25 = call i32 @__xorshift32(ptr @seed)
  store i32 %25, ptr %3, align 4
  %xor7 = xor i32 %25, %call4
  store i32 %xor7, ptr %arrayidx6, align 4
  %26 = call i32 @printPromt(i64 31)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, ptr %1, align 4
  %28 = load i32, ptr %i, align 4
  %xor8 = xor i32 %27, %28
  %inc = add nsw i32 %xor8, 1
  %29 = call i32 @__xorshift32(ptr @seed)
  store i32 %29, ptr %1, align 4
  %xor9 = xor i32 %29, %inc
  store i32 %xor9, ptr %i, align 4
  %30 = call i32 @printPromt(i64 31)
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %31 = call i32 @__xorshift32(ptr @seed)
  store i32 %31, ptr %4, align 4
  %xor10 = xor i32 %31, 0
  store i32 %xor10, ptr %i7, align 4
  %32 = call i32 @printPromt(i64 31)
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc16, %for.end
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %i7, align 4
  %xor11 = xor i32 %33, %34
  %cmp9 = icmp slt i32 %xor11, 1000000
  br i1 %cmp9, label %for.body10, label %for.end18

for.body10:                                       ; preds = %for.cond8
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %i7, align 4
  %xor12 = xor i32 %35, %36
  %idxprom11 = sext i32 %xor12 to i64
  %arrayidx12 = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom11
  %37 = load i32, ptr %arrayidx12, align 4
  %inc13 = add nsw i32 %37, 1
  %38 = call i32 @__xorshift32(ptr @seed)
  store i32 %38, ptr %5, align 4
  %xor13 = xor i32 %38, %inc13
  store i32 %xor13, ptr %arrayidx12, align 4
  %39 = call i32 @printPromt(i64 31)
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %i7, align 4
  %xor14 = xor i32 %40, %41
  %idxprom14 = sext i32 %xor14 to i64
  %arrayidx15 = getelementptr inbounds [1000000 x i32], ptr @static_array, i64 0, i64 %idxprom14
  %42 = load i32, ptr %arrayidx15, align 4
  %43 = load i32, ptr @static_variable, align 4
  %add = add nsw i32 %43, %42
  %44 = call i32 @__xorshift32(ptr @seed)
  store i32 %44, ptr %6, align 4
  %xor15 = xor i32 %44, %add
  store i32 %xor15, ptr @static_variable, align 4
  %45 = call i32 @printPromt(i64 31)
  br label %for.inc16

for.inc16:                                        ; preds = %for.body10
  %46 = load i32, ptr %4, align 4
  %47 = load i32, ptr %i7, align 4
  %xor16 = xor i32 %46, %47
  %inc17 = add nsw i32 %xor16, 1
  %48 = call i32 @__xorshift32(ptr @seed)
  store i32 %48, ptr %4, align 4
  %xor17 = xor i32 %48, %inc17
  store i32 %xor17, ptr %i7, align 4
  %49 = call i32 @printPromt(i64 31)
  br label %for.cond8, !llvm.loop !8

for.end18:                                        ; preds = %for.cond8
  %50 = call i32 @__xorshift32(ptr @seed)
  store i32 %50, ptr %7, align 4
  %xor18 = xor i32 %50, 0
  store i32 %xor18, ptr %i19, align 4
  %51 = call i32 @printPromt(i64 31)
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc29, %for.end18
  %52 = load i32, ptr %7, align 4
  %53 = load i32, ptr %i19, align 4
  %xor19 = xor i32 %52, %53
  %cmp21 = icmp slt i32 %xor19, 1000000
  br i1 %cmp21, label %for.body22, label %for.end31

for.body22:                                       ; preds = %for.cond20
  %54 = load ptr, ptr %dynamic_array, align 8
  %55 = load i32, ptr %7, align 4
  %56 = load i32, ptr %i19, align 4
  %xor20 = xor i32 %55, %56
  %idxprom23 = sext i32 %xor20 to i64
  %arrayidx24 = getelementptr inbounds i32, ptr %54, i64 %idxprom23
  %57 = load i32, ptr %arrayidx24, align 4
  %inc25 = add nsw i32 %57, 1
  %58 = call i32 @__xorshift32(ptr @seed)
  store i32 %58, ptr %8, align 4
  %xor21 = xor i32 %58, %inc25
  store i32 %xor21, ptr %arrayidx24, align 4
  %59 = call i32 @printPromt(i64 31)
  %60 = load ptr, ptr %dynamic_array, align 8
  %61 = load i32, ptr %7, align 4
  %62 = load i32, ptr %i19, align 4
  %xor22 = xor i32 %61, %62
  %idxprom26 = sext i32 %xor22 to i64
  %arrayidx27 = getelementptr inbounds i32, ptr %60, i64 %idxprom26
  %63 = load i32, ptr %arrayidx27, align 4
  %64 = load i32, ptr %6, align 4
  %65 = load i32, ptr @static_variable, align 4
  %xor23 = xor i32 %64, %65
  %add28 = add nsw i32 %xor23, %63
  %66 = call i32 @__xorshift32(ptr @seed)
  store i32 %66, ptr %6, align 4
  %xor24 = xor i32 %66, %add28
  store i32 %xor24, ptr @static_variable, align 4
  %67 = call i32 @printPromt(i64 31)
  br label %for.inc29

for.inc29:                                        ; preds = %for.body22
  %68 = load i32, ptr %7, align 4
  %69 = load i32, ptr %i19, align 4
  %xor25 = xor i32 %68, %69
  %inc30 = add nsw i32 %xor25, 1
  %70 = call i32 @__xorshift32(ptr @seed)
  store i32 %70, ptr %7, align 4
  %xor26 = xor i32 %70, %inc30
  store i32 %xor26, ptr %i19, align 4
  %71 = call i32 @printPromt(i64 31)
  br label %for.cond20, !llvm.loop !9

for.end31:                                        ; preds = %for.cond20
  %72 = load i32, ptr %6, align 4
  %73 = load i32, ptr @static_variable, align 4
  %xor27 = xor i32 %72, %73
  %call32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %xor27)
  %74 = load ptr, ptr %dynamic_array, align 8
  call void @free(ptr noundef %74) #5
  %75 = call i32 @__xorshift32(ptr @seed)
  store i32 %75, ptr %0, align 4
  %xor28 = xor i32 %75, 0
  store i32 %xor28, ptr %retval, align 4
  %76 = call i32 @printPromt(i64 31)
  br label %return

return:                                           ; preds = %for.end31, %if.then
  %77 = load i32, ptr %0, align 4
  %78 = load i32, ptr %retval, align 4
  %xor29 = xor i32 %77, %78
  ret i32 %xor29
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

declare i32 @printPromt(i64)

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

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
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i64 noundef %1)
  %2 = load i64, ptr %numOut, align 8
  %conv = trunc i64 %2 to i32
  ret i32 %conv
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 15.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
