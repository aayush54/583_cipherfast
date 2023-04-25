; ModuleID = 'test/toy_cipherfix.c'
source_filename = "test/toy_cipherfix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.public_comp.r = private unnamed_addr constant [4 x i8] c"AbCe", align 1
@.str = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@__const.main.charset = private unnamed_addr constant [63 x i8] c"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\00", align 16
@__const.main.m = private unnamed_addr constant [16 x i8] c"\0C\B8dV\A7:U\D1\90\1B\BD\0BL\FF\13m", align 16
@__const.main.pub1 = private unnamed_addr constant [4 x i8] c"\0A\0B\0C\0D", align 1
@__const.main.pub2 = private unnamed_addr constant [4 x i8] c"\11\223D", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"public-comp:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"secret-comp:\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"mix-comp:\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @classify(ptr noundef %ptr, i32 noundef %length) #0 {
entry:
  %ptr.addr = alloca ptr, align 8
  %length.addr = alloca i32, align 4
  store ptr %ptr, ptr %ptr.addr, align 8
  store i32 %length, ptr %length.addr, align 4
  call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @declassify(ptr noundef %ptr, i32 noundef %length) #0 {
entry:
  %ptr.addr = alloca ptr, align 8
  %length.addr = alloca i32, align 4
  store ptr %ptr, ptr %ptr.addr, align 8
  store i32 %length, ptr %length.addr, align 4
  call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #5, !srcloc !7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @secret_comp(ptr noundef %p1, ptr noundef %m, ptr noundef %r1, ptr noundef %r2, ptr noundef %r3, ptr noundef %r4) #0 {
entry:
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
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load ptr, ptr %p1.addr, align 8
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %4 = load ptr, ptr %m.addr, align 8
  %5 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %4, i64 %idxprom1
  %6 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  %add = add nsw i32 %conv, %conv3
  %conv4 = trunc i32 %add to i8
  %7 = load ptr, ptr %r1.addr, align 8
  %8 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %7, i64 %idxprom5
  store i8 %conv4, ptr %arrayidx6, align 1
  %9 = load ptr, ptr %p1.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom7 = sext i32 %10 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %9, i64 %idxprom7
  %11 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %11 to i32
  %12 = load ptr, ptr %m.addr, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds i8, ptr %12, i64 %idxprom10
  %14 = load i8, ptr %arrayidx11, align 1
  %conv12 = sext i8 %14 to i32
  %mul = mul nsw i32 %conv9, %conv12
  %conv13 = trunc i32 %mul to i8
  %15 = load ptr, ptr %r2.addr, align 8
  %16 = load i32, ptr %i, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds i8, ptr %15, i64 %idxprom14
  store i8 %conv13, ptr %arrayidx15, align 1
  %17 = load ptr, ptr %p1.addr, align 8
  %18 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %18 to i64
  %arrayidx17 = getelementptr inbounds i8, ptr %17, i64 %idxprom16
  %19 = load i8, ptr %arrayidx17, align 1
  %conv18 = sext i8 %19 to i32
  %20 = load ptr, ptr %m.addr, align 8
  %21 = load i32, ptr %i, align 4
  %idxprom19 = sext i32 %21 to i64
  %arrayidx20 = getelementptr inbounds i8, ptr %20, i64 %idxprom19
  %22 = load i8, ptr %arrayidx20, align 1
  %conv21 = sext i8 %22 to i32
  %sub = sub nsw i32 %conv18, %conv21
  %conv22 = trunc i32 %sub to i8
  %23 = load ptr, ptr %r3.addr, align 8
  %24 = load i32, ptr %i, align 4
  %idxprom23 = sext i32 %24 to i64
  %arrayidx24 = getelementptr inbounds i8, ptr %23, i64 %idxprom23
  store i8 %conv22, ptr %arrayidx24, align 1
  %25 = load ptr, ptr %p1.addr, align 8
  %26 = load i32, ptr %i, align 4
  %idxprom25 = sext i32 %26 to i64
  %arrayidx26 = getelementptr inbounds i8, ptr %25, i64 %idxprom25
  %27 = load i8, ptr %arrayidx26, align 1
  %conv27 = sext i8 %27 to i32
  %28 = load ptr, ptr %m.addr, align 8
  %29 = load i32, ptr %i, align 4
  %idxprom28 = sext i32 %29 to i64
  %arrayidx29 = getelementptr inbounds i8, ptr %28, i64 %idxprom28
  %30 = load i8, ptr %arrayidx29, align 1
  %conv30 = sext i8 %30 to i32
  %rem = srem i32 %conv27, %conv30
  %conv31 = trunc i32 %rem to i8
  %31 = load ptr, ptr %r4.addr, align 8
  %32 = load i32, ptr %i, align 4
  %idxprom32 = sext i32 %32 to i64
  %arrayidx33 = getelementptr inbounds i8, ptr %31, i64 %idxprom32
  store i8 %conv31, ptr %arrayidx33, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %33 = load i32, ptr %i, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mix_comp(ptr noundef %result, ptr noundef %public, ptr noundef %private, i32 noundef %size) #0 {
entry:
  %result.addr = alloca ptr, align 8
  %public.addr = alloca ptr, align 8
  %private.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %result, ptr %result.addr, align 8
  store ptr %public, ptr %public.addr, align 8
  store ptr %private, ptr %private.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %public.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %5 = load ptr, ptr %private.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %5, i64 %idxprom1
  %7 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %mul = mul nsw i32 %conv, %conv3
  %conv4 = trunc i32 %mul to i8
  %8 = load ptr, ptr %result.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %8, i64 %idxprom5
  store i8 %conv4, ptr %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @public_comp(ptr noundef %result, ptr noundef %input1, ptr noundef %input2, i32 noundef %size) #0 {
entry:
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
  store i32 %size, ptr %size.addr, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %r, ptr align 1 @__const.public_comp.r, i64 4, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %input1.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %5 = load ptr, ptr %input2.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %5, i64 %idxprom1
  %7 = load i8, ptr %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %mul = mul nsw i32 %conv, %conv3
  %conv4 = trunc i32 %mul to i8
  %8 = load ptr, ptr %result.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %8, i64 %idxprom5
  store i8 %conv4, ptr %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc19, %for.end
  %11 = load i32, ptr %i7, align 4
  %12 = load i32, ptr %size.addr, align 4
  %cmp9 = icmp slt i32 %11, %12
  br i1 %cmp9, label %for.body11, label %for.end21

for.body11:                                       ; preds = %for.cond8
  %13 = load i32, ptr %i7, align 4
  %idxprom12 = sext i32 %13 to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr %r, i64 0, i64 %idxprom12
  %14 = load i8, ptr %arrayidx13, align 1
  %conv14 = sext i8 %14 to i32
  %15 = load ptr, ptr %result.addr, align 8
  %16 = load i32, ptr %i7, align 4
  %idxprom15 = sext i32 %16 to i64
  %arrayidx16 = getelementptr inbounds i8, ptr %15, i64 %idxprom15
  %17 = load i8, ptr %arrayidx16, align 1
  %conv17 = sext i8 %17 to i32
  %add = add nsw i32 %conv17, %conv14
  %conv18 = trunc i32 %add to i8
  store i8 %conv18, ptr %arrayidx16, align 1
  br label %for.inc19

for.inc19:                                        ; preds = %for.body11
  %18 = load i32, ptr %i7, align 4
  %inc20 = add nsw i32 %18, 1
  store i32 %inc20, ptr %i7, align 4
  br label %for.cond8, !llvm.loop !12

for.end21:                                        ; preds = %for.cond8
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_char(ptr noundef %input) #0 {
entry:
  %input.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %input, ptr %input.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %conv = sext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %1)
  %2 = load ptr, ptr %input.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, ptr %2, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv2 = sext i8 %4 to i32
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %conv2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !13

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
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
  %i30 = alloca i32, align 4
  %i42 = alloca i32, align 4
  %i56 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %key, i8 0, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %charset, ptr align 16 @__const.main.charset, i64 63, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %mul = mul nsw i32 3, %1
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds [63 x i8], ptr %charset, i64 0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %3 = load i32, ptr %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom1
  store i8 %2, ptr %arrayidx2, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, ptr %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i, align 4
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
  %5 = load ptr, ptr %p1, align 8
  %arraydecay7 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %5, ptr align 16 %arraydecay7, i64 4, i1 false)
  %6 = load ptr, ptr %p2, align 8
  %arraydecay8 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay8, i64 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 1 %add.ptr, i64 4, i1 false)
  %7 = load ptr, ptr %p3, align 8
  %arraydecay9 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr10 = getelementptr inbounds i8, ptr %arraydecay9, i64 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %7, ptr align 1 %add.ptr10, i64 4, i1 false)
  %8 = load ptr, ptr %p4, align 8
  %arraydecay11 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 0
  %add.ptr12 = getelementptr inbounds i8, ptr %arraydecay11, i64 12
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %8, ptr align 1 %add.ptr12, i64 4, i1 false)
  %9 = load ptr, ptr %p1, align 8
  %arraydecay13 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay15 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay17 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %9, ptr noundef %arraydecay13, ptr noundef %arraydecay14, ptr noundef %arraydecay15, ptr noundef %arraydecay16, ptr noundef %arraydecay17)
  %10 = load ptr, ptr %p2, align 8
  %arraydecay18 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay20 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %10, ptr noundef %arraydecay18, ptr noundef %arraydecay19, ptr noundef %arraydecay20, ptr noundef %arraydecay21, ptr noundef %arraydecay22)
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
  %call29 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %i30, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc37, %for.end
  %11 = load i32, ptr %i30, align 4
  %cmp32 = icmp slt i32 %11, 4
  br i1 %cmp32, label %for.body33, label %for.end39

for.body33:                                       ; preds = %for.cond31
  %12 = load i32, ptr %i30, align 4
  %idxprom34 = sext i32 %12 to i64
  %arrayidx35 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 %idxprom34
  %13 = load i8, ptr %arrayidx35, align 1
  %conv = sext i8 %13 to i32
  %call36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %conv)
  br label %for.inc37

for.inc37:                                        ; preds = %for.body33
  %14 = load i32, ptr %i30, align 4
  %inc38 = add nsw i32 %14, 1
  store i32 %inc38, ptr %i30, align 4
  br label %for.cond31, !llvm.loop !15

for.end39:                                        ; preds = %for.cond31
  %call40 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %call41 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %i42, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc51, %for.end39
  %15 = load i32, ptr %i42, align 4
  %cmp44 = icmp slt i32 %15, 4
  br i1 %cmp44, label %for.body46, label %for.end53

for.body46:                                       ; preds = %for.cond43
  %16 = load ptr, ptr %p2, align 8
  %17 = load i32, ptr %i42, align 4
  %idxprom47 = sext i32 %17 to i64
  %arrayidx48 = getelementptr inbounds i8, ptr %16, i64 %idxprom47
  %18 = load i8, ptr %arrayidx48, align 1
  %conv49 = sext i8 %18 to i32
  %call50 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %conv49)
  br label %for.inc51

for.inc51:                                        ; preds = %for.body46
  %19 = load i32, ptr %i42, align 4
  %inc52 = add nsw i32 %19, 1
  store i32 %inc52, ptr %i42, align 4
  br label %for.cond43, !llvm.loop !16

for.end53:                                        ; preds = %for.cond43
  %call54 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %call55 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %i56, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc65, %for.end53
  %20 = load i32, ptr %i56, align 4
  %cmp58 = icmp slt i32 %20, 4
  br i1 %cmp58, label %for.body60, label %for.end67

for.body60:                                       ; preds = %for.cond57
  %21 = load i32, ptr %i56, align 4
  %idxprom61 = sext i32 %21 to i64
  %arrayidx62 = getelementptr inbounds [4 x i8], ptr %mix, i64 0, i64 %idxprom61
  %22 = load i8, ptr %arrayidx62, align 1
  %conv63 = sext i8 %22 to i32
  %call64 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %conv63)
  br label %for.inc65

for.inc65:                                        ; preds = %for.body60
  %23 = load i32, ptr %i56, align 4
  %inc66 = add nsw i32 %23, 1
  store i32 %inc66, ptr %i56, align 4
  br label %for.cond57, !llvm.loop !17

for.end67:                                        ; preds = %for.cond57
  %call68 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret i32 0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

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
