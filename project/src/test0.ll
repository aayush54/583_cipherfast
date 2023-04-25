; ModuleID = 'test0.bc'
source_filename = "../../test0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.secret_pool = private unnamed_addr constant [3 x <{ i8, [9 x i8] }>] [<{ i8, [9 x i8] }> <{ i8 65, [9 x i8] zeroinitializer }>, <{ i8, [9 x i8] }> <{ i8 66, [9 x i8] zeroinitializer }>, <{ i8, [9 x i8] }> <{ i8 67, [9 x i8] zeroinitializer }>], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"EOF\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %secret_pool = alloca [3 x [10 x i8]], align 16
  %i = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i16 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %secret_pool, ptr align 16 @__const.main.secret_pool, i64 30, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx1 = getelementptr inbounds [10 x i8], ptr %arrayidx, i64 0, i64 %idxprom
  %2 = load i8, ptr %arrayidx1, align 1
  %conv = sext i8 %2 to i32
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %i3, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc13, %for.end
  %4 = load i32, ptr %i3, align 4
  %cmp5 = icmp slt i32 %4, 10
  br i1 %cmp5, label %for.body7, label %for.end15

for.body7:                                        ; preds = %for.cond4
  %5 = load i32, ptr %i3, align 4
  %arrayidx8 = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %6 = load i32, ptr %i3, align 4
  %idxprom9 = sext i32 %6 to i64
  %arrayidx10 = getelementptr inbounds [10 x i8], ptr %arrayidx8, i64 0, i64 %idxprom9
  %7 = load i8, ptr %arrayidx10, align 1
  %conv11 = sext i8 %7 to i32
  %add = add nsw i32 %conv11, %5
  %conv12 = trunc i32 %add to i8
  store i8 %conv12, ptr %arrayidx10, align 1
  br label %for.inc13

for.inc13:                                        ; preds = %for.body7
  %8 = load i32, ptr %i3, align 4
  %inc14 = add nsw i32 %8, 1
  store i32 %inc14, ptr %i3, align 4
  br label %for.cond4, !llvm.loop !8

for.end15:                                        ; preds = %for.cond4
  store i32 0, ptr %i16, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc26, %for.end15
  %9 = load i32, ptr %i16, align 4
  %cmp18 = icmp slt i32 %9, 10
  br i1 %cmp18, label %for.body20, label %for.end28

for.body20:                                       ; preds = %for.cond17
  %arrayidx21 = getelementptr inbounds [3 x [10 x i8]], ptr %secret_pool, i64 0, i64 1
  %10 = load i32, ptr %i16, align 4
  %idxprom22 = sext i32 %10 to i64
  %arrayidx23 = getelementptr inbounds [10 x i8], ptr %arrayidx21, i64 0, i64 %idxprom22
  %11 = load i8, ptr %arrayidx23, align 1
  %conv24 = sext i8 %11 to i32
  %call25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %conv24)
  br label %for.inc26

for.inc26:                                        ; preds = %for.body20
  %12 = load i32, ptr %i16, align 4
  %inc27 = add nsw i32 %12, 1
  store i32 %inc27, ptr %i16, align 4
  br label %for.cond17, !llvm.loop !9

for.end28:                                        ; preds = %for.cond17
  %call29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret i32 0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

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
