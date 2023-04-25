; ModuleID = 'test0.masked.bc'
source_filename = "../../test0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.secret_pool = private unnamed_addr constant [3 x <{ i8, [9 x i8] }>] [<{ i8, [9 x i8] }> <{ i8 65, [9 x i8] zeroinitializer }>, <{ i8, [9 x i8] }> <{ i8 66, [9 x i8] zeroinitializer }>, <{ i8, [9 x i8] }> <{ i8 67, [9 x i8] zeroinitializer }>], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"EOF\0A\00", align 1
@seed = private unnamed_addr global [1 x i64] [i64 47]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %secret_pool = alloca [3 x [10 x i8]], align 16
  %i = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i16 = alloca i32, align 4
  %6 = call i32 @__xorshift32(ptr @seed)
  store i32 %6, ptr %0, align 4
  %xor = xor i32 %6, 0
  store i32 %xor, ptr %retval, align 4
  %7 = call i32 @__xorshift32(ptr @seed)
  store i32 %7, ptr %1, align 4
  %xor1 = xor i32 %7, %argc
  store i32 %xor1, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %secret_pool, ptr align 16 @__const.main.secret_pool, i64 30, i1 false)
  %8 = call i32 @__xorshift32(ptr @seed)
  store i32 %8, ptr %2, align 4
  %xor2 = xor i32 %8, 0
  store i32 %xor2, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %i, align 4
  %xor3 = xor i32 %9, %10
  %cmp = icmp slt i32 %xor3, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %i, align 4
  %xor4 = xor i32 %11, %12
  %idxprom = sext i32 %xor4 to i64
  %arrayidx1 = getelementptr inbounds [10 x i8], ptr %arrayidx, i64 0, i64 %idxprom
  %13 = load i8, ptr %arrayidx1, align 1
  %conv = sext i8 %13 to i32
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %i, align 4
  %xor5 = xor i32 %14, %15
  %inc = add nsw i32 %xor5, 1
  %16 = call i32 @__xorshift32(ptr @seed)
  store i32 %16, ptr %2, align 4
  %xor6 = xor i32 %16, %inc
  store i32 %xor6, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %17 = call i32 @__xorshift32(ptr @seed)
  store i32 %17, ptr %3, align 4
  %xor7 = xor i32 %17, 0
  store i32 %xor7, ptr %i3, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc13, %for.end
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %i3, align 4
  %xor8 = xor i32 %18, %19
  %cmp5 = icmp slt i32 %xor8, 10
  br i1 %cmp5, label %for.body7, label %for.end15

for.body7:                                        ; preds = %for.cond4
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %i3, align 4
  %xor9 = xor i32 %20, %21
  %arrayidx8 = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %i3, align 4
  %xor10 = xor i32 %22, %23
  %idxprom9 = sext i32 %xor10 to i64
  %arrayidx10 = getelementptr inbounds [10 x i8], ptr %arrayidx8, i64 0, i64 %idxprom9
  %24 = load i8, ptr %arrayidx10, align 1
  %conv11 = sext i8 %24 to i32
  %add = add nsw i32 %conv11, %xor9
  %conv12 = trunc i32 %add to i8
  %25 = call i8 @__xorshift8(ptr @seed)
  store i8 %25, ptr %4, align 1
  %xor11 = xor i8 %25, %conv12
  store i8 %xor11, ptr %arrayidx10, align 1
  br label %for.inc13

for.inc13:                                        ; preds = %for.body7
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %i3, align 4
  %xor12 = xor i32 %26, %27
  %inc14 = add nsw i32 %xor12, 1
  %28 = call i32 @__xorshift32(ptr @seed)
  store i32 %28, ptr %3, align 4
  %xor13 = xor i32 %28, %inc14
  store i32 %xor13, ptr %i3, align 4
  br label %for.cond4, !llvm.loop !8

for.end15:                                        ; preds = %for.cond4
  %29 = call i32 @__xorshift32(ptr @seed)
  store i32 %29, ptr %5, align 4
  %xor14 = xor i32 %29, 0
  store i32 %xor14, ptr %i16, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc26, %for.end15
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %i16, align 4
  %xor15 = xor i32 %30, %31
  %cmp18 = icmp slt i32 %xor15, 10
  br i1 %cmp18, label %for.body20, label %for.end28

for.body20:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %i16, align 4
  %xor16 = xor i32 %32, %33
  %idxprom22 = sext i32 %xor16 to i64
  %arrayidx23 = getelementptr inbounds [10 x i8], ptr %arrayidx21, i64 0, i64 %idxprom22
  %34 = load i8, ptr %arrayidx23, align 1
  %conv24 = sext i8 %34 to i32
  %call25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %conv24)
  br label %for.inc26

for.inc26:                                        ; preds = %for.body20
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %i16, align 4
  %xor17 = xor i32 %35, %36
  %inc27 = add nsw i32 %xor17, 1
  %37 = call i32 @__xorshift32(ptr @seed)
  store i32 %37, ptr %5, align 4
  %xor18 = xor i32 %37, %inc27
  store i32 %xor18, ptr %i16, align 4
  br label %for.cond17, !llvm.loop !9

for.end28:                                        ; preds = %for.cond17
  %call29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret i32 0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

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
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
