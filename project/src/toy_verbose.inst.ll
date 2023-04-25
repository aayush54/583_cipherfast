; ModuleID = 'toy_verbose.inst.bc'
source_filename = "../../toy_cipherfix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.public_comp.r = private unnamed_addr constant [4 x i8] c"\01\04\10@", align 1
@.str = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@__const.main.charset = private unnamed_addr constant [63 x i8] c"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\00", align 16
@__const.main.m = private unnamed_addr constant [16 x i8] c"\0C\B8dV\A7:U\D1\90\1B\BD\0BL\FF\13m", align 16
@__const.main.pub1 = private unnamed_addr constant [4 x i8] c"\0A\0B\0C\0D", align 1
@__const.main.pub2 = private unnamed_addr constant [4 x i8] c"\11\223D", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"EOL\0A\00", align 1
@seed = private unnamed_addr global [1 x i64] [i64 47]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @classify(ptr noundef %ptr, i32 noundef %length) #0 {
entry:
  %0 = alloca i32, align 4
  %ptr.addr = alloca ptr, align 8
  %length.addr = alloca i32, align 4
  store ptr %ptr, ptr %ptr.addr, align 8
  %1 = call i32 @__xorshift32(ptr @seed)
  store i32 %1, ptr %0, align 4
  %xor = xor i32 %1, %length
  store i32 %xor, ptr %length.addr, align 4
  call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @declassify(ptr noundef %ptr, i32 noundef %length) #0 {
entry:
  %0 = alloca i32, align 4
  %ptr.addr = alloca ptr, align 8
  %length.addr = alloca i32, align 4
  store ptr %ptr, ptr %ptr.addr, align 8
  %1 = call i32 @__xorshift32(ptr @seed)
  store i32 %1, ptr %0, align 4
  %xor = xor i32 %1, %length
  store i32 %xor, ptr %length.addr, align 4
  call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @secret_comp(ptr noundef %p1, ptr noundef %m, ptr noundef %r1, ptr noundef %r2, ptr noundef %r3, ptr noundef %r4) #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %p1.addr = alloca ptr, align 8
  %m.addr = alloca ptr, align 8
  %r1.addr = alloca ptr, align 8
  %r2.addr = alloca ptr, align 8
  %r3.addr = alloca ptr, align 8
  %r4.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %p1, ptr %p1.addr, align 8
  store ptr %m, ptr %m.addr, align 8
  store ptr %r1, ptr %r1.addr, align 8
  store ptr %r2, ptr %r2.addr, align 8
  store ptr %r3, ptr %r3.addr, align 8
  store ptr %r4, ptr %r4.addr, align 8
  %5 = call i32 @__xorshift32(ptr @seed)
  store i32 %5, ptr %0, align 4
  %xor = xor i32 %5, 0
  store i32 %xor, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %0, align 4
  %7 = load i32, ptr %i, align 4
  %xor1 = xor i32 %6, %7
  %cmp = icmp slt i32 %xor1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load ptr, ptr %p1.addr, align 8
  %9 = load i32, ptr %0, align 4
  %10 = load i32, ptr %i, align 4
  %xor2 = xor i32 %9, %10
  %idxprom = sext i32 %xor2 to i64
  %arrayidx = getelementptr inbounds i8, ptr %8, i64 %idxprom
  %11 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %11 to i32
  %12 = load ptr, ptr %m.addr, align 8
  %13 = load i32, ptr %0, align 4
  %14 = load i32, ptr %i, align 4
  %xor3 = xor i32 %13, %14
  %idxprom1 = sext i32 %xor3 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %12, i64 %idxprom1
  %15 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %15 to i32
  %add = add nsw i32 %conv, %conv3
  %conv4 = trunc i32 %add to i8
  %16 = load ptr, ptr %r1.addr, align 8
  %17 = load i32, ptr %0, align 4
  %18 = load i32, ptr %i, align 4
  %xor4 = xor i32 %17, %18
  %idxprom5 = sext i32 %xor4 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %16, i64 %idxprom5
  %19 = call i8 @__xorshift8(ptr @seed)
  store i8 %19, ptr %1, align 1
  %xor5 = xor i8 %19, %conv4
  store i8 %xor5, ptr %arrayidx6, align 1
  %20 = load ptr, ptr %p1.addr, align 8
  %21 = load i32, ptr %0, align 4
  %22 = load i32, ptr %i, align 4
  %xor6 = xor i32 %21, %22
  %idxprom7 = sext i32 %xor6 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %20, i64 %idxprom7
  %23 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %23 to i32
  %24 = load ptr, ptr %m.addr, align 8
  %25 = load i32, ptr %0, align 4
  %26 = load i32, ptr %i, align 4
  %xor7 = xor i32 %25, %26
  %idxprom10 = sext i32 %xor7 to i64
  %arrayidx11 = getelementptr inbounds i8, ptr %24, i64 %idxprom10
  %27 = load i8, ptr %arrayidx11, align 1
  %conv12 = sext i8 %27 to i32
  %mul = mul nsw i32 %conv9, %conv12
  %conv13 = trunc i32 %mul to i8
  %28 = load ptr, ptr %r2.addr, align 8
  %29 = load i32, ptr %0, align 4
  %30 = load i32, ptr %i, align 4
  %xor8 = xor i32 %29, %30
  %idxprom14 = sext i32 %xor8 to i64
  %arrayidx15 = getelementptr inbounds i8, ptr %28, i64 %idxprom14
  %31 = call i8 @__xorshift8(ptr @seed)
  store i8 %31, ptr %2, align 1
  %xor9 = xor i8 %31, %conv13
  store i8 %xor9, ptr %arrayidx15, align 1
  %32 = load ptr, ptr %p1.addr, align 8
  %33 = load i32, ptr %0, align 4
  %34 = load i32, ptr %i, align 4
  %xor10 = xor i32 %33, %34
  %idxprom16 = sext i32 %xor10 to i64
  %arrayidx17 = getelementptr inbounds i8, ptr %32, i64 %idxprom16
  %35 = load i8, ptr %arrayidx17, align 1
  %conv18 = sext i8 %35 to i32
  %36 = load ptr, ptr %m.addr, align 8
  %37 = load i32, ptr %0, align 4
  %38 = load i32, ptr %i, align 4
  %xor11 = xor i32 %37, %38
  %idxprom19 = sext i32 %xor11 to i64
  %arrayidx20 = getelementptr inbounds i8, ptr %36, i64 %idxprom19
  %39 = load i8, ptr %arrayidx20, align 1
  %conv21 = sext i8 %39 to i32
  %sub = sub nsw i32 %conv18, %conv21
  %conv22 = trunc i32 %sub to i8
  %40 = load ptr, ptr %r3.addr, align 8
  %41 = load i32, ptr %0, align 4
  %42 = load i32, ptr %i, align 4
  %xor12 = xor i32 %41, %42
  %idxprom23 = sext i32 %xor12 to i64
  %arrayidx24 = getelementptr inbounds i8, ptr %40, i64 %idxprom23
  %43 = call i8 @__xorshift8(ptr @seed)
  store i8 %43, ptr %3, align 1
  %xor13 = xor i8 %43, %conv22
  store i8 %xor13, ptr %arrayidx24, align 1
  %44 = load ptr, ptr %p1.addr, align 8
  %45 = load i32, ptr %0, align 4
  %46 = load i32, ptr %i, align 4
  %xor14 = xor i32 %45, %46
  %idxprom25 = sext i32 %xor14 to i64
  %arrayidx26 = getelementptr inbounds i8, ptr %44, i64 %idxprom25
  %47 = load i8, ptr %arrayidx26, align 1
  %conv27 = sext i8 %47 to i32
  %48 = load ptr, ptr %m.addr, align 8
  %49 = load i32, ptr %0, align 4
  %50 = load i32, ptr %i, align 4
  %xor15 = xor i32 %49, %50
  %idxprom28 = sext i32 %xor15 to i64
  %arrayidx29 = getelementptr inbounds i8, ptr %48, i64 %idxprom28
  %51 = load i8, ptr %arrayidx29, align 1
  %conv30 = sext i8 %51 to i32
  %rem = srem i32 %conv27, %conv30
  %conv31 = trunc i32 %rem to i8
  %52 = load ptr, ptr %r4.addr, align 8
  %53 = load i32, ptr %0, align 4
  %54 = load i32, ptr %i, align 4
  %xor16 = xor i32 %53, %54
  %idxprom32 = sext i32 %xor16 to i64
  %arrayidx33 = getelementptr inbounds i8, ptr %52, i64 %idxprom32
  %55 = call i8 @__xorshift8(ptr @seed)
  store i8 %55, ptr %4, align 1
  %xor17 = xor i8 %55, %conv31
  store i8 %xor17, ptr %arrayidx33, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %56 = load i32, ptr %0, align 4
  %57 = load i32, ptr %i, align 4
  %xor18 = xor i32 %56, %57
  %inc = add nsw i32 %xor18, 1
  %58 = call i32 @__xorshift32(ptr @seed)
  store i32 %58, ptr %0, align 4
  %xor19 = xor i32 %58, %inc
  store i32 %xor19, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mix_comp(ptr noundef %result, ptr noundef %public, ptr noundef %private, i32 noundef %size) #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %result.addr = alloca ptr, align 8
  %public.addr = alloca ptr, align 8
  %private.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %result, ptr %result.addr, align 8
  store ptr %public, ptr %public.addr, align 8
  store ptr %private, ptr %private.addr, align 8
  %3 = call i32 @__xorshift32(ptr @seed)
  store i32 %3, ptr %0, align 4
  %xor = xor i32 %3, %size
  store i32 %xor, ptr %size.addr, align 4
  %4 = call i32 @__xorshift32(ptr @seed)
  store i32 %4, ptr %1, align 4
  %xor1 = xor i32 %4, 0
  store i32 %xor1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr %i, align 4
  %xor2 = xor i32 %5, %6
  %7 = load i32, ptr %0, align 4
  %8 = load i32, ptr %size.addr, align 4
  %xor3 = xor i32 %7, %8
  %cmp = icmp slt i32 %xor2, %xor3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load ptr, ptr %public.addr, align 8
  %10 = load i32, ptr %1, align 4
  %11 = load i32, ptr %i, align 4
  %xor4 = xor i32 %10, %11
  %idxprom = sext i32 %xor4 to i64
  %arrayidx = getelementptr inbounds i8, ptr %9, i64 %idxprom
  %12 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %12 to i32
  %13 = load ptr, ptr %private.addr, align 8
  %14 = load i32, ptr %1, align 4
  %15 = load i32, ptr %i, align 4
  %xor5 = xor i32 %14, %15
  %idxprom1 = sext i32 %xor5 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %13, i64 %idxprom1
  %16 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %16 to i32
  %mul = mul nsw i32 %conv, %conv3
  %conv4 = trunc i32 %mul to i8
  %17 = load ptr, ptr %result.addr, align 8
  %18 = load i32, ptr %1, align 4
  %19 = load i32, ptr %i, align 4
  %xor6 = xor i32 %18, %19
  %idxprom5 = sext i32 %xor6 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %17, i64 %idxprom5
  %20 = call i8 @__xorshift8(ptr @seed)
  store i8 %20, ptr %2, align 1
  %xor7 = xor i8 %20, %conv4
  store i8 %xor7, ptr %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i32, ptr %1, align 4
  %22 = load i32, ptr %i, align 4
  %xor8 = xor i32 %21, %22
  %inc = add nsw i32 %xor8, 1
  %23 = call i32 @__xorshift32(ptr @seed)
  store i32 %23, ptr %1, align 4
  %xor9 = xor i32 %23, %inc
  store i32 %xor9, ptr %i, align 4
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @public_comp(ptr noundef %result, ptr noundef %input1, ptr noundef %input2, i32 noundef %size) #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %result.addr = alloca ptr, align 8
  %input1.addr = alloca ptr, align 8
  %input2.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %r = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  store ptr %result, ptr %result.addr, align 8
  store ptr %input1, ptr %input1.addr, align 8
  store ptr %input2, ptr %input2.addr, align 8
  %5 = call i32 @__xorshift32(ptr @seed)
  store i32 %5, ptr %0, align 4
  %xor = xor i32 %5, %size
  store i32 %xor, ptr %size.addr, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %r, ptr align 1 @__const.public_comp.r, i64 4, i1 false)
  %6 = call i32 @__xorshift32(ptr @seed)
  store i32 %6, ptr %1, align 4
  %xor1 = xor i32 %6, 0
  store i32 %xor1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, ptr %1, align 4
  %8 = load i32, ptr %i, align 4
  %xor2 = xor i32 %7, %8
  %9 = load i32, ptr %0, align 4
  %10 = load i32, ptr %size.addr, align 4
  %xor3 = xor i32 %9, %10
  %cmp = icmp slt i32 %xor2, %xor3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load ptr, ptr %input1.addr, align 8
  %12 = load i32, ptr %1, align 4
  %13 = load i32, ptr %i, align 4
  %xor4 = xor i32 %12, %13
  %idxprom = sext i32 %xor4 to i64
  %arrayidx = getelementptr inbounds i8, ptr %11, i64 %idxprom
  %14 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %14 to i32
  %15 = load ptr, ptr %input2.addr, align 8
  %16 = load i32, ptr %1, align 4
  %17 = load i32, ptr %i, align 4
  %xor5 = xor i32 %16, %17
  %idxprom1 = sext i32 %xor5 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %15, i64 %idxprom1
  %18 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %18 to i32
  %mul = mul nsw i32 %conv, %conv3
  %conv4 = trunc i32 %mul to i8
  %19 = load ptr, ptr %result.addr, align 8
  %20 = load i32, ptr %1, align 4
  %21 = load i32, ptr %i, align 4
  %xor6 = xor i32 %20, %21
  %idxprom5 = sext i32 %xor6 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %19, i64 %idxprom5
  %22 = call i8 @__xorshift8(ptr @seed)
  store i8 %22, ptr %2, align 1
  %xor7 = xor i8 %22, %conv4
  store i8 %xor7, ptr %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %23 = load i32, ptr %1, align 4
  %24 = load i32, ptr %i, align 4
  %xor8 = xor i32 %23, %24
  %inc = add nsw i32 %xor8, 1
  %25 = call i32 @__xorshift32(ptr @seed)
  store i32 %25, ptr %1, align 4
  %xor9 = xor i32 %25, %inc
  store i32 %xor9, ptr %i, align 4
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %26 = call i32 @__xorshift32(ptr @seed)
  store i32 %26, ptr %3, align 4
  %xor10 = xor i32 %26, 0
  store i32 %xor10, ptr %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc19, %for.end
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %i7, align 4
  %xor11 = xor i32 %27, %28
  %29 = load i32, ptr %0, align 4
  %30 = load i32, ptr %size.addr, align 4
  %xor12 = xor i32 %29, %30
  %cmp9 = icmp slt i32 %xor11, %xor12
  br i1 %cmp9, label %for.body11, label %for.end21

for.body11:                                       ; preds = %for.cond8
  %31 = load i32, ptr %3, align 4
  %32 = load i32, ptr %i7, align 4
  %xor13 = xor i32 %31, %32
  %idxprom12 = sext i32 %xor13 to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr %r, i64 0, i64 %idxprom12
  %33 = load i8, ptr %arrayidx13, align 1
  %conv14 = sext i8 %33 to i32
  %34 = load ptr, ptr %result.addr, align 8
  %35 = load i32, ptr %3, align 4
  %36 = load i32, ptr %i7, align 4
  %xor14 = xor i32 %35, %36
  %idxprom15 = sext i32 %xor14 to i64
  %arrayidx16 = getelementptr inbounds i8, ptr %34, i64 %idxprom15
  %37 = load i8, ptr %arrayidx16, align 1
  %conv17 = sext i8 %37 to i32
  %add = add nsw i32 %conv17, %conv14
  %conv18 = trunc i32 %add to i8
  %38 = call i8 @__xorshift8(ptr @seed)
  store i8 %38, ptr %4, align 1
  %xor15 = xor i8 %38, %conv18
  store i8 %xor15, ptr %arrayidx16, align 1
  br label %for.inc19

for.inc19:                                        ; preds = %for.body11
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %i7, align 4
  %xor16 = xor i32 %39, %40
  %inc20 = add nsw i32 %xor16, 1
  %41 = call i32 @__xorshift32(ptr @seed)
  store i32 %41, ptr %3, align 4
  %xor17 = xor i32 %41, %inc20
  store i32 %xor17, ptr %i7, align 4
  br label %for.cond8, !llvm.loop !12

for.end21:                                        ; preds = %for.cond8
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_char(ptr noundef %input) #0 {
entry:
  %0 = alloca i32, align 4
  %input.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %input, ptr %input.addr, align 8
  %1 = call i32 @__xorshift32(ptr @seed)
  store i32 %1, ptr %0, align 4
  %xor = xor i32 %1, 0
  store i32 %xor, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %0, align 4
  %3 = load i32, ptr %i, align 4
  %xor1 = xor i32 %2, %3
  %conv = sext i32 %xor1 to i64
  %cmp = icmp ult i64 %conv, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, ptr %0, align 4
  %5 = load i32, ptr %i, align 4
  %xor2 = xor i32 %4, %5
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %xor2)
  %6 = load ptr, ptr %input.addr, align 8
  %7 = load i32, ptr %0, align 4
  %8 = load i32, ptr %i, align 4
  %xor3 = xor i32 %7, %8
  %idxprom = sext i32 %xor3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %6, i64 %idxprom
  %9 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %9 to i32
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %conv2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %0, align 4
  %11 = load i32, ptr %i, align 4
  %xor4 = xor i32 %10, %11
  %inc = add nsw i32 %xor4, 1
  %12 = call i32 @__xorshift32(ptr @seed)
  store i32 %12, ptr %0, align 4
  %xor5 = xor i32 %12, %inc
  store i32 %xor5, ptr %i, align 4
  br label %for.cond, !llvm.loop !13

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %retval = alloca i32, align 4
  %key = alloca [16 x i8], align 16
  %charset = alloca [63 x i8], align 16
  %i = alloca i32, align 4
  %m = alloca [16 x i8], align 16
  %p1 = alloca ptr, align 8
  %p2 = alloca ptr, align 8
  %p3 = alloca ptr, align 8
  %p4 = alloca ptr, align 8
  %result1 = alloca [4 x i8], align 1
  %result2 = alloca [4 x i8], align 1
  %result3 = alloca [4 x i8], align 1
  %result4 = alloca [4 x i8], align 1
  %pub1 = alloca [4 x i8], align 1
  %pub2 = alloca [4 x i8], align 1
  %pub3 = alloca [4 x i8], align 1
  %mix = alloca [4 x i8], align 1
  %i29 = alloca i32, align 4
  %i40 = alloca i32, align 4
  %i53 = alloca i32, align 4
  %i66 = alloca i32, align 4
  %i79 = alloca i32, align 4
  %i92 = alloca i32, align 4
  %9 = call i32 @__xorshift32(ptr @seed)
  store i32 %9, ptr %0, align 4
  %xor = xor i32 %9, 0
  store i32 %xor, ptr %retval, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %key, i8 0, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %charset, ptr align 16 @__const.main.charset, i64 63, i1 false)
  %10 = call i32 @__xorshift32(ptr @seed)
  store i32 %10, ptr %1, align 4
  %xor1 = xor i32 %10, 0
  store i32 %xor1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i32, ptr %1, align 4
  %12 = load i32, ptr %i, align 4
  %xor2 = xor i32 %11, %12
  %cmp = icmp slt i32 %xor2, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %1, align 4
  %14 = load i32, ptr %i, align 4
  %xor3 = xor i32 %13, %14
  %mul = mul nsw i32 3, %xor3
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds [63 x i8], ptr %charset, i64 0, i64 %idxprom
  %15 = load i8, ptr %arrayidx, align 1
  %16 = load i32, ptr %1, align 4
  %17 = load i32, ptr %i, align 4
  %xor4 = xor i32 %16, %17
  %idxprom1 = sext i32 %xor4 to i64
  %arrayidx2 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom1
  %18 = call i8 @__xorshift8(ptr @seed)
  store i8 %18, ptr %2, align 1
  %xor5 = xor i8 %18, %15
  store i8 %xor5, ptr %arrayidx2, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, ptr %1, align 4
  %20 = load i32, ptr %i, align 4
  %xor6 = xor i32 %19, %20
  %inc = add nsw i32 %xor6, 1
  %21 = call i32 @__xorshift32(ptr @seed)
  store i32 %21, ptr %1, align 4
  %xor7 = xor i32 %21, %inc
  store i32 %xor7, ptr %i, align 4
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %m, ptr align 16 @__const.main.m, i64 16, i1 false)
  %arraydecay = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  call void @classify(ptr noundef %arraydecay, i32 noundef 16)
  %arraydecay3 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  call void @classify(ptr noundef %arraydecay3, i32 noundef 16)
  %call = call noalias ptr @malloc(i64 noundef 4) #6
  store ptr %call, ptr %p1, align 8
  %call4 = call noalias ptr @malloc(i64 noundef 4) #6
  store ptr %call4, ptr %p2, align 8
  %call5 = call noalias ptr @malloc(i64 noundef 4) #6
  store ptr %call5, ptr %p3, align 8
  %call6 = call noalias ptr @malloc(i64 noundef 4) #6
  store ptr %call6, ptr %p4, align 8
  %22 = load ptr, ptr %p1, align 8
  %arraydecay7 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %22, ptr align 16 %arraydecay7, i64 4, i1 false)
  %23 = load ptr, ptr %p2, align 8
  %arraydecay8 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay8, i64 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %23, ptr align 1 %add.ptr, i64 4, i1 false)
  %24 = load ptr, ptr %p3, align 8
  %arraydecay9 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i64 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %24, ptr align 1 %add.ptr10, i64 4, i1 false)
  %25 = load ptr, ptr %p4, align 8
  %arraydecay11 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr12 = getelementptr inbounds i8, ptr %arraydecay11, i64 12
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %25, ptr align 1 %add.ptr12, i64 4, i1 false)
  %26 = load ptr, ptr %p1, align 8
  %arraydecay13 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay15 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay17 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %26, ptr noundef %arraydecay13, ptr noundef %arraydecay14, ptr noundef %arraydecay15, ptr noundef %arraydecay16, ptr noundef %arraydecay17)
  %27 = load ptr, ptr %p2, align 8
  %arraydecay18 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay20 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %27, ptr noundef %arraydecay18, ptr noundef %arraydecay19, ptr noundef %arraydecay20, ptr noundef %arraydecay21, ptr noundef %arraydecay22)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %pub1, ptr align 1 @__const.main.pub1, i64 4, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %pub2, ptr align 1 @__const.main.pub2, i64 4, i1 false)
  %arraydecay23 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [4 x i8], ptr %pub1, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [4 x i8], ptr %pub2, i64 0, i64 0
  call void @public_comp(ptr noundef %arraydecay23, ptr noundef %arraydecay24, ptr noundef %arraydecay25, i32 noundef 4)
  %arraydecay26 = getelementptr inbounds [4 x i8], ptr %mix, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 0
  %arraydecay28 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  call void @mix_comp(ptr noundef %arraydecay26, ptr noundef %arraydecay27, ptr noundef %arraydecay28, i32 noundef 4)
  %28 = call i32 @__xorshift32(ptr @seed)
  store i32 %28, ptr %3, align 4
  %xor8 = xor i32 %28, 0
  store i32 %xor8, ptr %i29, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc36, %for.end
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %i29, align 4
  %xor9 = xor i32 %29, %30
  %cmp31 = icmp slt i32 %xor9, 4
  br i1 %cmp31, label %for.body32, label %for.end38

for.body32:                                       ; preds = %for.cond30
  %31 = load i32, ptr %3, align 4
  %32 = load i32, ptr %i29, align 4
  %xor10 = xor i32 %31, %32
  %idxprom33 = sext i32 %xor10 to i64
  %arrayidx34 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 %idxprom33
  %33 = load i8, ptr %arrayidx34, align 1
  %conv = sext i8 %33 to i32
  %call35 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv)
  br label %for.inc36

for.inc36:                                        ; preds = %for.body32
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %i29, align 4
  %xor11 = xor i32 %34, %35
  %inc37 = add nsw i32 %xor11, 1
  %36 = call i32 @__xorshift32(ptr @seed)
  store i32 %36, ptr %3, align 4
  %xor12 = xor i32 %36, %inc37
  store i32 %xor12, ptr %i29, align 4
  br label %for.cond30, !llvm.loop !15

for.end38:                                        ; preds = %for.cond30
  %call39 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %37 = call i32 @__xorshift32(ptr @seed)
  store i32 %37, ptr %4, align 4
  %xor13 = xor i32 %37, 0
  store i32 %xor13, ptr %i40, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc49, %for.end38
  %38 = load i32, ptr %4, align 4
  %39 = load i32, ptr %i40, align 4
  %xor14 = xor i32 %38, %39
  %cmp42 = icmp slt i32 %xor14, 4
  br i1 %cmp42, label %for.body44, label %for.end51

for.body44:                                       ; preds = %for.cond41
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %i40, align 4
  %xor15 = xor i32 %40, %41
  %idxprom45 = sext i32 %xor15 to i64
  %arrayidx46 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 %idxprom45
  %42 = load i8, ptr %arrayidx46, align 1
  %conv47 = sext i8 %42 to i32
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv47)
  br label %for.inc49

for.inc49:                                        ; preds = %for.body44
  %43 = load i32, ptr %4, align 4
  %44 = load i32, ptr %i40, align 4
  %xor16 = xor i32 %43, %44
  %inc50 = add nsw i32 %xor16, 1
  %45 = call i32 @__xorshift32(ptr @seed)
  store i32 %45, ptr %4, align 4
  %xor17 = xor i32 %45, %inc50
  store i32 %xor17, ptr %i40, align 4
  br label %for.cond41, !llvm.loop !16

for.end51:                                        ; preds = %for.cond41
  %call52 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %46 = call i32 @__xorshift32(ptr @seed)
  store i32 %46, ptr %5, align 4
  %xor18 = xor i32 %46, 0
  store i32 %xor18, ptr %i53, align 4
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc62, %for.end51
  %47 = load i32, ptr %5, align 4
  %48 = load i32, ptr %i53, align 4
  %xor19 = xor i32 %47, %48
  %cmp55 = icmp slt i32 %xor19, 4
  br i1 %cmp55, label %for.body57, label %for.end64

for.body57:                                       ; preds = %for.cond54
  %49 = load i32, ptr %5, align 4
  %50 = load i32, ptr %i53, align 4
  %xor20 = xor i32 %49, %50
  %idxprom58 = sext i32 %xor20 to i64
  %arrayidx59 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 %idxprom58
  %51 = load i8, ptr %arrayidx59, align 1
  %conv60 = sext i8 %51 to i32
  %call61 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv60)
  br label %for.inc62

for.inc62:                                        ; preds = %for.body57
  %52 = load i32, ptr %5, align 4
  %53 = load i32, ptr %i53, align 4
  %xor21 = xor i32 %52, %53
  %inc63 = add nsw i32 %xor21, 1
  %54 = call i32 @__xorshift32(ptr @seed)
  store i32 %54, ptr %5, align 4
  %xor22 = xor i32 %54, %inc63
  store i32 %xor22, ptr %i53, align 4
  br label %for.cond54, !llvm.loop !17

for.end64:                                        ; preds = %for.cond54
  %call65 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %55 = call i32 @__xorshift32(ptr @seed)
  store i32 %55, ptr %6, align 4
  %xor23 = xor i32 %55, 0
  store i32 %xor23, ptr %i66, align 4
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc75, %for.end64
  %56 = load i32, ptr %6, align 4
  %57 = load i32, ptr %i66, align 4
  %xor24 = xor i32 %56, %57
  %cmp68 = icmp slt i32 %xor24, 4
  br i1 %cmp68, label %for.body70, label %for.end77

for.body70:                                       ; preds = %for.cond67
  %58 = load i32, ptr %6, align 4
  %59 = load i32, ptr %i66, align 4
  %xor25 = xor i32 %58, %59
  %idxprom71 = sext i32 %xor25 to i64
  %arrayidx72 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 %idxprom71
  %60 = load i8, ptr %arrayidx72, align 1
  %conv73 = sext i8 %60 to i32
  %call74 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv73)
  br label %for.inc75

for.inc75:                                        ; preds = %for.body70
  %61 = load i32, ptr %6, align 4
  %62 = load i32, ptr %i66, align 4
  %xor26 = xor i32 %61, %62
  %inc76 = add nsw i32 %xor26, 1
  %63 = call i32 @__xorshift32(ptr @seed)
  store i32 %63, ptr %6, align 4
  %xor27 = xor i32 %63, %inc76
  store i32 %xor27, ptr %i66, align 4
  br label %for.cond67, !llvm.loop !18

for.end77:                                        ; preds = %for.cond67
  %call78 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %64 = call i32 @__xorshift32(ptr @seed)
  store i32 %64, ptr %7, align 4
  %xor28 = xor i32 %64, 0
  store i32 %xor28, ptr %i79, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc88, %for.end77
  %65 = load i32, ptr %7, align 4
  %66 = load i32, ptr %i79, align 4
  %xor29 = xor i32 %65, %66
  %cmp81 = icmp slt i32 %xor29, 4
  br i1 %cmp81, label %for.body83, label %for.end90

for.body83:                                       ; preds = %for.cond80
  %67 = load i32, ptr %7, align 4
  %68 = load i32, ptr %i79, align 4
  %xor30 = xor i32 %67, %68
  %idxprom84 = sext i32 %xor30 to i64
  %arrayidx85 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 %idxprom84
  %69 = load i8, ptr %arrayidx85, align 1
  %conv86 = sext i8 %69 to i32
  %call87 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv86)
  br label %for.inc88

for.inc88:                                        ; preds = %for.body83
  %70 = load i32, ptr %7, align 4
  %71 = load i32, ptr %i79, align 4
  %xor31 = xor i32 %70, %71
  %inc89 = add nsw i32 %xor31, 1
  %72 = call i32 @__xorshift32(ptr @seed)
  store i32 %72, ptr %7, align 4
  %xor32 = xor i32 %72, %inc89
  store i32 %xor32, ptr %i79, align 4
  br label %for.cond80, !llvm.loop !19

for.end90:                                        ; preds = %for.cond80
  %call91 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %73 = call i32 @__xorshift32(ptr @seed)
  store i32 %73, ptr %8, align 4
  %xor33 = xor i32 %73, 0
  store i32 %xor33, ptr %i92, align 4
  br label %for.cond93

for.cond93:                                       ; preds = %for.inc101, %for.end90
  %74 = load i32, ptr %8, align 4
  %75 = load i32, ptr %i92, align 4
  %xor34 = xor i32 %74, %75
  %cmp94 = icmp slt i32 %xor34, 4
  br i1 %cmp94, label %for.body96, label %for.end103

for.body96:                                       ; preds = %for.cond93
  %76 = load i32, ptr %8, align 4
  %77 = load i32, ptr %i92, align 4
  %xor35 = xor i32 %76, %77
  %idxprom97 = sext i32 %xor35 to i64
  %arrayidx98 = getelementptr inbounds [4 x i8], ptr %mix, i64 0, i64 %idxprom97
  %78 = load i8, ptr %arrayidx98, align 1
  %conv99 = sext i8 %78 to i32
  %call100 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv99)
  br label %for.inc101

for.inc101:                                       ; preds = %for.body96
  %79 = load i32, ptr %8, align 4
  %80 = load i32, ptr %i92, align 4
  %xor36 = xor i32 %79, %80
  %inc102 = add nsw i32 %xor36, 1
  %81 = call i32 @__xorshift32(ptr @seed)
  store i32 %81, ptr %8, align 4
  %xor37 = xor i32 %81, %inc102
  store i32 %xor37, ptr %i92, align 4
  br label %for.cond93, !llvm.loop !20

for.end103:                                       ; preds = %for.cond93
  %call104 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret i32 0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

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
attributes #3 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.6"}
!6 = !{i64 221}
!7 = !{i64 389}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
