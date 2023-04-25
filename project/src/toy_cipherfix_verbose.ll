; ModuleID = 'toy_cipherfix_verbose.bc'
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
  %i13 = alloca i32, align 4
  %i24 = alloca i32, align 4
  %i35 = alloca i32, align 4
  %i47 = alloca i32, align 4
  %result1 = alloca [4 x i8], align 1
  %result2 = alloca [4 x i8], align 1
  %result3 = alloca [4 x i8], align 1
  %result4 = alloca [4 x i8], align 1
  %pub1 = alloca [4 x i8], align 1
  %pub2 = alloca [4 x i8], align 1
  %pub3 = alloca [4 x i8], align 1
  %mix = alloca [4 x i8], align 1
  %i75 = alloca i32, align 4
  %i86 = alloca i32, align 4
  %i99 = alloca i32, align 4
  %i112 = alloca i32, align 4
  %i125 = alloca i32, align 4
  %i138 = alloca i32, align 4
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
  store i32 0, ptr %i13, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc21, %for.end
  %9 = load i32, ptr %i13, align 4
  %cmp15 = icmp slt i32 %9, 4
  br i1 %cmp15, label %for.body16, label %for.end23

for.body16:                                       ; preds = %for.cond14
  %10 = load i32, ptr %i13, align 4
  %idxprom17 = sext i32 %10 to i64
  %arrayidx18 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom17
  %11 = load i8, ptr %arrayidx18, align 1
  %12 = load ptr, ptr %p1, align 8
  %13 = load i32, ptr %i13, align 4
  %idxprom19 = sext i32 %13 to i64
  %arrayidx20 = getelementptr inbounds i8, ptr %12, i64 %idxprom19
  store i8 %11, ptr %arrayidx20, align 1
  br label %for.inc21

for.inc21:                                        ; preds = %for.body16
  %14 = load i32, ptr %i13, align 4
  %inc22 = add nsw i32 %14, 1
  store i32 %inc22, ptr %i13, align 4
  br label %for.cond14, !llvm.loop !15

for.end23:                                        ; preds = %for.cond14
  store i32 0, ptr %i24, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc32, %for.end23
  %15 = load i32, ptr %i24, align 4
  %cmp26 = icmp slt i32 %15, 4
  br i1 %cmp26, label %for.body27, label %for.end34

for.body27:                                       ; preds = %for.cond25
  %16 = load i32, ptr %i24, align 4
  %add = add nsw i32 4, %16
  %idxprom28 = sext i32 %add to i64
  %arrayidx29 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom28
  %17 = load i8, ptr %arrayidx29, align 1
  %18 = load ptr, ptr %p2, align 8
  %19 = load i32, ptr %i24, align 4
  %idxprom30 = sext i32 %19 to i64
  %arrayidx31 = getelementptr inbounds i8, ptr %18, i64 %idxprom30
  store i8 %17, ptr %arrayidx31, align 1
  br label %for.inc32

for.inc32:                                        ; preds = %for.body27
  %20 = load i32, ptr %i24, align 4
  %inc33 = add nsw i32 %20, 1
  store i32 %inc33, ptr %i24, align 4
  br label %for.cond25, !llvm.loop !16

for.end34:                                        ; preds = %for.cond25
  store i32 0, ptr %i35, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc44, %for.end34
  %21 = load i32, ptr %i35, align 4
  %cmp37 = icmp slt i32 %21, 4
  br i1 %cmp37, label %for.body38, label %for.end46

for.body38:                                       ; preds = %for.cond36
  %22 = load i32, ptr %i35, align 4
  %add39 = add nsw i32 8, %22
  %idxprom40 = sext i32 %add39 to i64
  %arrayidx41 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom40
  %23 = load i8, ptr %arrayidx41, align 1
  %24 = load ptr, ptr %p3, align 8
  %25 = load i32, ptr %i35, align 4
  %idxprom42 = sext i32 %25 to i64
  %arrayidx43 = getelementptr inbounds i8, ptr %24, i64 %idxprom42
  store i8 %23, ptr %arrayidx43, align 1
  br label %for.inc44

for.inc44:                                        ; preds = %for.body38
  %26 = load i32, ptr %i35, align 4
  %inc45 = add nsw i32 %26, 1
  store i32 %inc45, ptr %i35, align 4
  br label %for.cond36, !llvm.loop !17

for.end46:                                        ; preds = %for.cond36
  store i32 0, ptr %i47, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc56, %for.end46
  %27 = load i32, ptr %i47, align 4
  %cmp49 = icmp slt i32 %27, 4
  br i1 %cmp49, label %for.body50, label %for.end58

for.body50:                                       ; preds = %for.cond48
  %28 = load i32, ptr %i47, align 4
  %add51 = add nsw i32 12, %28
  %idxprom52 = sext i32 %add51 to i64
  %arrayidx53 = getelementptr inbounds [16 x i8], ptr %key, i64 0, i64 %idxprom52
  %29 = load i8, ptr %arrayidx53, align 1
  %30 = load ptr, ptr %p4, align 8
  %31 = load i32, ptr %i47, align 4
  %idxprom54 = sext i32 %31 to i64
  %arrayidx55 = getelementptr inbounds i8, ptr %30, i64 %idxprom54
  store i8 %29, ptr %arrayidx55, align 1
  br label %for.inc56

for.inc56:                                        ; preds = %for.body50
  %32 = load i32, ptr %i47, align 4
  %inc57 = add nsw i32 %32, 1
  store i32 %inc57, ptr %i47, align 4
  br label %for.cond48, !llvm.loop !18

for.end58:                                        ; preds = %for.cond48
  %33 = load ptr, ptr %p1, align 8
  %arraydecay59 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay60 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay61 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay62 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay63 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %33, ptr noundef %arraydecay59, ptr noundef %arraydecay60, ptr noundef %arraydecay61, ptr noundef %arraydecay62, ptr noundef %arraydecay63)
  %34 = load ptr, ptr %p2, align 8
  %arraydecay64 = getelementptr inbounds [16 x i8], ptr %m, i64 0, i64 0
  %arraydecay65 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  %arraydecay66 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 0
  %arraydecay67 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 0
  %arraydecay68 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 0
  call void @secret_comp(ptr noundef %34, ptr noundef %arraydecay64, ptr noundef %arraydecay65, ptr noundef %arraydecay66, ptr noundef %arraydecay67, ptr noundef %arraydecay68)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %pub1, ptr align 1 @__const.main.pub1, i64 4, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %pub2, ptr align 1 @__const.main.pub2, i64 4, i1 false)
  %arraydecay69 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 0
  %arraydecay70 = getelementptr inbounds [4 x i8], ptr %pub1, i64 0, i64 0
  %arraydecay71 = getelementptr inbounds [4 x i8], ptr %pub2, i64 0, i64 0
  call void @public_comp(ptr noundef %arraydecay69, ptr noundef %arraydecay70, ptr noundef %arraydecay71, i32 noundef 4)
  %arraydecay72 = getelementptr inbounds [4 x i8], ptr %mix, i64 0, i64 0
  %arraydecay73 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 0
  %arraydecay74 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 0
  call void @mix_comp(ptr noundef %arraydecay72, ptr noundef %arraydecay73, ptr noundef %arraydecay74, i32 noundef 4)
  store i32 0, ptr %i75, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc82, %for.end58
  %35 = load i32, ptr %i75, align 4
  %cmp77 = icmp slt i32 %35, 4
  br i1 %cmp77, label %for.body78, label %for.end84

for.body78:                                       ; preds = %for.cond76
  %36 = load i32, ptr %i75, align 4
  %idxprom79 = sext i32 %36 to i64
  %arrayidx80 = getelementptr inbounds [4 x i8], ptr %result1, i64 0, i64 %idxprom79
  %37 = load i8, ptr %arrayidx80, align 1
  %conv = sext i8 %37 to i32
  %call81 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv)
  br label %for.inc82

for.inc82:                                        ; preds = %for.body78
  %38 = load i32, ptr %i75, align 4
  %inc83 = add nsw i32 %38, 1
  store i32 %inc83, ptr %i75, align 4
  br label %for.cond76, !llvm.loop !19

for.end84:                                        ; preds = %for.cond76
  %call85 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %i86, align 4
  br label %for.cond87

for.cond87:                                       ; preds = %for.inc95, %for.end84
  %39 = load i32, ptr %i86, align 4
  %cmp88 = icmp slt i32 %39, 4
  br i1 %cmp88, label %for.body90, label %for.end97

for.body90:                                       ; preds = %for.cond87
  %40 = load i32, ptr %i86, align 4
  %idxprom91 = sext i32 %40 to i64
  %arrayidx92 = getelementptr inbounds [4 x i8], ptr %result2, i64 0, i64 %idxprom91
  %41 = load i8, ptr %arrayidx92, align 1
  %conv93 = sext i8 %41 to i32
  %call94 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv93)
  br label %for.inc95

for.inc95:                                        ; preds = %for.body90
  %42 = load i32, ptr %i86, align 4
  %inc96 = add nsw i32 %42, 1
  store i32 %inc96, ptr %i86, align 4
  br label %for.cond87, !llvm.loop !20

for.end97:                                        ; preds = %for.cond87
  %call98 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %i99, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc108, %for.end97
  %43 = load i32, ptr %i99, align 4
  %cmp101 = icmp slt i32 %43, 4
  br i1 %cmp101, label %for.body103, label %for.end110

for.body103:                                      ; preds = %for.cond100
  %44 = load i32, ptr %i99, align 4
  %idxprom104 = sext i32 %44 to i64
  %arrayidx105 = getelementptr inbounds [4 x i8], ptr %result3, i64 0, i64 %idxprom104
  %45 = load i8, ptr %arrayidx105, align 1
  %conv106 = sext i8 %45 to i32
  %call107 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv106)
  br label %for.inc108

for.inc108:                                       ; preds = %for.body103
  %46 = load i32, ptr %i99, align 4
  %inc109 = add nsw i32 %46, 1
  store i32 %inc109, ptr %i99, align 4
  br label %for.cond100, !llvm.loop !21

for.end110:                                       ; preds = %for.cond100
  %call111 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %i112, align 4
  br label %for.cond113

for.cond113:                                      ; preds = %for.inc121, %for.end110
  %47 = load i32, ptr %i112, align 4
  %cmp114 = icmp slt i32 %47, 4
  br i1 %cmp114, label %for.body116, label %for.end123

for.body116:                                      ; preds = %for.cond113
  %48 = load i32, ptr %i112, align 4
  %idxprom117 = sext i32 %48 to i64
  %arrayidx118 = getelementptr inbounds [4 x i8], ptr %result4, i64 0, i64 %idxprom117
  %49 = load i8, ptr %arrayidx118, align 1
  %conv119 = sext i8 %49 to i32
  %call120 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv119)
  br label %for.inc121

for.inc121:                                       ; preds = %for.body116
  %50 = load i32, ptr %i112, align 4
  %inc122 = add nsw i32 %50, 1
  store i32 %inc122, ptr %i112, align 4
  br label %for.cond113, !llvm.loop !22

for.end123:                                       ; preds = %for.cond113
  %call124 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %i125, align 4
  br label %for.cond126

for.cond126:                                      ; preds = %for.inc134, %for.end123
  %51 = load i32, ptr %i125, align 4
  %cmp127 = icmp slt i32 %51, 4
  br i1 %cmp127, label %for.body129, label %for.end136

for.body129:                                      ; preds = %for.cond126
  %52 = load i32, ptr %i125, align 4
  %idxprom130 = sext i32 %52 to i64
  %arrayidx131 = getelementptr inbounds [4 x i8], ptr %pub3, i64 0, i64 %idxprom130
  %53 = load i8, ptr %arrayidx131, align 1
  %conv132 = sext i8 %53 to i32
  %call133 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv132)
  br label %for.inc134

for.inc134:                                       ; preds = %for.body129
  %54 = load i32, ptr %i125, align 4
  %inc135 = add nsw i32 %54, 1
  store i32 %inc135, ptr %i125, align 4
  br label %for.cond126, !llvm.loop !23

for.end136:                                       ; preds = %for.cond126
  %call137 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %i138, align 4
  br label %for.cond139

for.cond139:                                      ; preds = %for.inc147, %for.end136
  %55 = load i32, ptr %i138, align 4
  %cmp140 = icmp slt i32 %55, 4
  br i1 %cmp140, label %for.body142, label %for.end149

for.body142:                                      ; preds = %for.cond139
  %56 = load i32, ptr %i138, align 4
  %idxprom143 = sext i32 %56 to i64
  %arrayidx144 = getelementptr inbounds [4 x i8], ptr %mix, i64 0, i64 %idxprom143
  %57 = load i8, ptr %arrayidx144, align 1
  %conv145 = sext i8 %57 to i32
  %call146 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %conv145)
  br label %for.inc147

for.inc147:                                       ; preds = %for.body142
  %58 = load i32, ptr %i138, align 4
  %inc148 = add nsw i32 %58, 1
  store i32 %inc148, ptr %i138, align 4
  br label %for.cond139, !llvm.loop !24

for.end149:                                       ; preds = %for.cond139
  %call150 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
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
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !9}
!24 = distinct !{!24, !9}
