; ModuleID = '<stdin>'
source_filename = "test/toy_cipherfix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.public_comp.r = private unnamed_addr constant [4 x i8] c"AbCe", align 1
@.str = private unnamed_addr constant [3 x i8] c"%i\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"public-comp:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"secret-comp:\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"mix-comp:\00", align 1
@seed = private unnamed_addr global [1 x i64] [i64 47]

; Function Attrs: noinline nounwind uwtable
define dso_local void @classify(ptr nocapture readnone %ptr, i32 %length) local_unnamed_addr #0 {
entry:
  tail call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @declassify(ptr nocapture noundef readnone %ptr, i32 noundef %length) local_unnamed_addr #0 {
entry:
  tail call void asm sideeffect "", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !6
  ret void
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local void @secret_comp(ptr nocapture noundef readonly %p1, ptr nocapture noundef readonly %m, ptr nocapture noundef writeonly %r1, ptr nocapture noundef writeonly %r2, ptr nocapture noundef writeonly %r3, ptr nocapture noundef writeonly %r4) local_unnamed_addr #1 {
entry:
  %0 = alloca i8, align 1
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i8, align 1
  %15 = alloca i8, align 1
  %16 = load i8, ptr %p1, align 1, !tbaa !7
  %17 = load i8, ptr %m, align 1, !tbaa !7
  %add = add i8 %17, %16
  %18 = call i8 @__xorshift8(ptr @seed)
  store i8 %18, ptr %0, align 1
  %xor = xor i8 %18, %add
  store i8 %xor, ptr %r1, align 1, !tbaa !7
  %19 = load i8, ptr %p1, align 1, !tbaa !7
  %20 = load i8, ptr %m, align 1, !tbaa !7
  %mul = mul i8 %20, %19
  %21 = call i8 @__xorshift8(ptr @seed)
  store i8 %21, ptr %1, align 1
  %xor1 = xor i8 %21, %mul
  store i8 %xor1, ptr %r2, align 1, !tbaa !7
  %22 = load i8, ptr %p1, align 1, !tbaa !7
  %23 = load i8, ptr %m, align 1, !tbaa !7
  %sub = sub i8 %22, %23
  %24 = call i8 @__xorshift8(ptr @seed)
  store i8 %24, ptr %2, align 1
  %xor2 = xor i8 %24, %sub
  store i8 %xor2, ptr %r3, align 1, !tbaa !7
  %25 = load i8, ptr %p1, align 1, !tbaa !7
  %26 = load i8, ptr %m, align 1, !tbaa !7
  %rem.lhs.trunc = sext i8 %25 to i16
  %rem.rhs.trunc = sext i8 %26 to i16
  %rem53 = srem i16 %rem.lhs.trunc, %rem.rhs.trunc
  %conv31 = trunc i16 %rem53 to i8
  %27 = call i8 @__xorshift8(ptr @seed)
  store i8 %27, ptr %3, align 1
  %xor3 = xor i8 %27, %conv31
  store i8 %xor3, ptr %r4, align 1, !tbaa !7
  %arrayidx.1 = getelementptr inbounds i8, ptr %p1, i64 1
  %28 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %arrayidx2.1 = getelementptr inbounds i8, ptr %m, i64 1
  %29 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %add.1 = add i8 %29, %28
  %arrayidx6.1 = getelementptr inbounds i8, ptr %r1, i64 1
  %30 = call i8 @__xorshift8(ptr @seed)
  store i8 %30, ptr %4, align 1
  %xor4 = xor i8 %30, %add.1
  store i8 %xor4, ptr %arrayidx6.1, align 1, !tbaa !7
  %31 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %32 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %mul.1 = mul i8 %32, %31
  %arrayidx15.1 = getelementptr inbounds i8, ptr %r2, i64 1
  %33 = call i8 @__xorshift8(ptr @seed)
  store i8 %33, ptr %5, align 1
  %xor5 = xor i8 %33, %mul.1
  store i8 %xor5, ptr %arrayidx15.1, align 1, !tbaa !7
  %34 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %35 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %sub.1 = sub i8 %34, %35
  %arrayidx24.1 = getelementptr inbounds i8, ptr %r3, i64 1
  %36 = call i8 @__xorshift8(ptr @seed)
  store i8 %36, ptr %6, align 1
  %xor6 = xor i8 %36, %sub.1
  store i8 %xor6, ptr %arrayidx24.1, align 1, !tbaa !7
  %37 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %38 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %rem.lhs.trunc.1 = sext i8 %37 to i16
  %rem.rhs.trunc.1 = sext i8 %38 to i16
  %rem53.1 = srem i16 %rem.lhs.trunc.1, %rem.rhs.trunc.1
  %conv31.1 = trunc i16 %rem53.1 to i8
  %arrayidx33.1 = getelementptr inbounds i8, ptr %r4, i64 1
  %39 = call i8 @__xorshift8(ptr @seed)
  store i8 %39, ptr %7, align 1
  %xor7 = xor i8 %39, %conv31.1
  store i8 %xor7, ptr %arrayidx33.1, align 1, !tbaa !7
  %arrayidx.2 = getelementptr inbounds i8, ptr %p1, i64 2
  %40 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %arrayidx2.2 = getelementptr inbounds i8, ptr %m, i64 2
  %41 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %add.2 = add i8 %41, %40
  %arrayidx6.2 = getelementptr inbounds i8, ptr %r1, i64 2
  %42 = call i8 @__xorshift8(ptr @seed)
  store i8 %42, ptr %8, align 1
  %xor8 = xor i8 %42, %add.2
  store i8 %xor8, ptr %arrayidx6.2, align 1, !tbaa !7
  %43 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %44 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %mul.2 = mul i8 %44, %43
  %arrayidx15.2 = getelementptr inbounds i8, ptr %r2, i64 2
  %45 = call i8 @__xorshift8(ptr @seed)
  store i8 %45, ptr %9, align 1
  %xor9 = xor i8 %45, %mul.2
  store i8 %xor9, ptr %arrayidx15.2, align 1, !tbaa !7
  %46 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %47 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %sub.2 = sub i8 %46, %47
  %arrayidx24.2 = getelementptr inbounds i8, ptr %r3, i64 2
  %48 = call i8 @__xorshift8(ptr @seed)
  store i8 %48, ptr %10, align 1
  %xor10 = xor i8 %48, %sub.2
  store i8 %xor10, ptr %arrayidx24.2, align 1, !tbaa !7
  %49 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %50 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %rem.lhs.trunc.2 = sext i8 %49 to i16
  %rem.rhs.trunc.2 = sext i8 %50 to i16
  %rem53.2 = srem i16 %rem.lhs.trunc.2, %rem.rhs.trunc.2
  %conv31.2 = trunc i16 %rem53.2 to i8
  %arrayidx33.2 = getelementptr inbounds i8, ptr %r4, i64 2
  %51 = call i8 @__xorshift8(ptr @seed)
  store i8 %51, ptr %11, align 1
  %xor11 = xor i8 %51, %conv31.2
  store i8 %xor11, ptr %arrayidx33.2, align 1, !tbaa !7
  %arrayidx.3 = getelementptr inbounds i8, ptr %p1, i64 3
  %52 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %arrayidx2.3 = getelementptr inbounds i8, ptr %m, i64 3
  %53 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %add.3 = add i8 %53, %52
  %arrayidx6.3 = getelementptr inbounds i8, ptr %r1, i64 3
  %54 = call i8 @__xorshift8(ptr @seed)
  store i8 %54, ptr %12, align 1
  %xor12 = xor i8 %54, %add.3
  store i8 %xor12, ptr %arrayidx6.3, align 1, !tbaa !7
  %55 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %56 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %mul.3 = mul i8 %56, %55
  %arrayidx15.3 = getelementptr inbounds i8, ptr %r2, i64 3
  %57 = call i8 @__xorshift8(ptr @seed)
  store i8 %57, ptr %13, align 1
  %xor13 = xor i8 %57, %mul.3
  store i8 %xor13, ptr %arrayidx15.3, align 1, !tbaa !7
  %58 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %59 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %sub.3 = sub i8 %58, %59
  %arrayidx24.3 = getelementptr inbounds i8, ptr %r3, i64 3
  %60 = call i8 @__xorshift8(ptr @seed)
  store i8 %60, ptr %14, align 1
  %xor14 = xor i8 %60, %sub.3
  store i8 %xor14, ptr %arrayidx24.3, align 1, !tbaa !7
  %61 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %62 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %rem.lhs.trunc.3 = sext i8 %61 to i16
  %rem.rhs.trunc.3 = sext i8 %62 to i16
  %rem53.3 = srem i16 %rem.lhs.trunc.3, %rem.rhs.trunc.3
  %conv31.3 = trunc i16 %rem53.3 to i8
  %arrayidx33.3 = getelementptr inbounds i8, ptr %r4, i64 3
  %63 = call i8 @__xorshift8(ptr @seed)
  store i8 %63, ptr %15, align 1
  %xor15 = xor i8 %63, %conv31.3
  store i8 %xor15, ptr %arrayidx33.3, align 1, !tbaa !7
  ret void
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local void @mix_comp(ptr nocapture noundef writeonly %result, ptr nocapture noundef readonly %public, ptr nocapture noundef readonly %private, i32 noundef %size) local_unnamed_addr #1 {
entry:
  %0 = alloca i8, align 1
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %private16 = ptrtoint ptr %private to i64
  %public15 = ptrtoint ptr %public to i64
  %result14 = ptrtoint ptr %result to i64
  %cmp11 = icmp sgt i32 %size, 0
  br i1 %cmp11, label %iter.check, label %for.cond.cleanup

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %size to i64
  %min.iters.check = icmp ult i32 %size, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %5 = sub i64 %result14, %public15
  %diff.check = icmp ult i64 %5, 32
  %6 = sub i64 %result14, %private16
  %diff.check17 = icmp ult i64 %6, 32
  %conflict.rdx = or i1 %diff.check, %diff.check17
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check18 = icmp ult i32 %size, 32
  br i1 %min.iters.check18, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967264
  %7 = add nsw i64 %n.vec, -32
  %8 = lshr exact i64 %7, 5
  %9 = add nuw nsw i64 %8, 1
  %xtraiter = and i64 %9, 1
  %10 = icmp eq i64 %7, 0
  br i1 %10, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %9, 1152921504606846974
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.1, %vector.body ]
  %11 = getelementptr inbounds i8, ptr %public, i64 %index
  %wide.load = load <16 x i8>, ptr %11, align 1, !tbaa !7
  %12 = getelementptr inbounds i8, ptr %11, i64 16
  %wide.load19 = load <16 x i8>, ptr %12, align 1, !tbaa !7
  %13 = getelementptr inbounds i8, ptr %private, i64 %index
  %wide.load20 = load <16 x i8>, ptr %13, align 1, !tbaa !7
  %14 = getelementptr inbounds i8, ptr %13, i64 16
  %wide.load21 = load <16 x i8>, ptr %14, align 1, !tbaa !7
  %15 = mul <16 x i8> %wide.load20, %wide.load
  %16 = mul <16 x i8> %wide.load21, %wide.load19
  %17 = getelementptr inbounds i8, ptr %result, i64 %index
  store <16 x i8> %15, ptr %17, align 1, !tbaa !7
  %18 = getelementptr inbounds i8, ptr %17, i64 16
  store <16 x i8> %16, ptr %18, align 1, !tbaa !7
  %index.next = or i64 %index, 32
  %19 = getelementptr inbounds i8, ptr %public, i64 %index.next
  %wide.load.1 = load <16 x i8>, ptr %19, align 1, !tbaa !7
  %20 = getelementptr inbounds i8, ptr %19, i64 16
  %wide.load19.1 = load <16 x i8>, ptr %20, align 1, !tbaa !7
  %21 = getelementptr inbounds i8, ptr %private, i64 %index.next
  %wide.load20.1 = load <16 x i8>, ptr %21, align 1, !tbaa !7
  %22 = getelementptr inbounds i8, ptr %21, i64 16
  %wide.load21.1 = load <16 x i8>, ptr %22, align 1, !tbaa !7
  %23 = mul <16 x i8> %wide.load20.1, %wide.load.1
  %24 = mul <16 x i8> %wide.load21.1, %wide.load19.1
  %25 = getelementptr inbounds i8, ptr %result, i64 %index.next
  store <16 x i8> %23, ptr %25, align 1, !tbaa !7
  %26 = getelementptr inbounds i8, ptr %25, i64 16
  store <16 x i8> %24, ptr %26, align 1, !tbaa !7
  %index.next.1 = add nuw i64 %index, 64
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %27 = getelementptr inbounds i8, ptr %public, i64 %index.unr
  %wide.load.epil = load <16 x i8>, ptr %27, align 1, !tbaa !7
  %28 = getelementptr inbounds i8, ptr %27, i64 16
  %wide.load19.epil = load <16 x i8>, ptr %28, align 1, !tbaa !7
  %29 = getelementptr inbounds i8, ptr %private, i64 %index.unr
  %wide.load20.epil = load <16 x i8>, ptr %29, align 1, !tbaa !7
  %30 = getelementptr inbounds i8, ptr %29, i64 16
  %wide.load21.epil = load <16 x i8>, ptr %30, align 1, !tbaa !7
  %31 = mul <16 x i8> %wide.load20.epil, %wide.load.epil
  %32 = mul <16 x i8> %wide.load21.epil, %wide.load19.epil
  %33 = getelementptr inbounds i8, ptr %result, i64 %index.unr
  store <16 x i8> %31, ptr %33, align 1, !tbaa !7
  %34 = getelementptr inbounds i8, ptr %33, i64 16
  store <16 x i8> %32, ptr %34, align 1, !tbaa !7
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec23 = and i64 %wide.trip.count, 4294967288
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next28, %vec.epilog.vector.body ]
  %35 = getelementptr inbounds i8, ptr %public, i64 %offset.idx
  %wide.load26 = load <8 x i8>, ptr %35, align 1, !tbaa !7
  %36 = getelementptr inbounds i8, ptr %private, i64 %offset.idx
  %wide.load27 = load <8 x i8>, ptr %36, align 1, !tbaa !7
  %37 = mul <8 x i8> %wide.load27, %wide.load26
  %38 = getelementptr inbounds i8, ptr %result, i64 %offset.idx
  store <8 x i8> %37, ptr %38, align 1, !tbaa !7
  %index.next28 = add nuw i64 %offset.idx, 8
  %39 = icmp eq i64 %index.next28, %n.vec23
  br i1 %39, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !13

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n24 = icmp eq i64 %n.vec23, %wide.trip.count
  br i1 %cmp.n24, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec23, %vec.epilog.middle.block ]
  %40 = xor i64 %indvars.iv.ph, -1
  %41 = add nsw i64 %40, %wide.trip.count
  %xtraiter29 = and i64 %wide.trip.count, 3
  %lcmp.mod30.not = icmp eq i64 %xtraiter29, 0
  br i1 %lcmp.mod30.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %indvars.iv.ph, %for.body.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body.prol ], [ 0, %for.body.preheader ]
  %arrayidx.prol = getelementptr inbounds i8, ptr %public, i64 %indvars.iv.prol
  %42 = load i8, ptr %arrayidx.prol, align 1, !tbaa !7
  %arrayidx2.prol = getelementptr inbounds i8, ptr %private, i64 %indvars.iv.prol
  %43 = load i8, ptr %arrayidx2.prol, align 1, !tbaa !7
  %mul.prol = mul i8 %43, %42
  %arrayidx6.prol = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.prol
  %44 = call i8 @__xorshift8(ptr @seed)
  store i8 %44, ptr %0, align 1
  %xor = xor i8 %44, %mul.prol
  store i8 %xor, ptr %arrayidx6.prol, align 1, !tbaa !7
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter29
  br i1 %prol.iter.cmp.not, label %for.body.prol.loopexit, label %for.body.prol, !llvm.loop !15

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %45 = icmp ult i64 %41, 3
  br i1 %45, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body.prol.loopexit, %for.body, %middle.block, %vec.epilog.middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  %arrayidx = getelementptr inbounds i8, ptr %public, i64 %indvars.iv
  %46 = load i8, ptr %arrayidx, align 1, !tbaa !7
  %arrayidx2 = getelementptr inbounds i8, ptr %private, i64 %indvars.iv
  %47 = load i8, ptr %arrayidx2, align 1, !tbaa !7
  %mul = mul i8 %47, %46
  %arrayidx6 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv
  %48 = call i8 @__xorshift8(ptr @seed)
  store i8 %48, ptr %1, align 1
  %xor1 = xor i8 %48, %mul
  store i8 %xor1, ptr %arrayidx6, align 1, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds i8, ptr %public, i64 %indvars.iv.next
  %49 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %arrayidx2.1 = getelementptr inbounds i8, ptr %private, i64 %indvars.iv.next
  %50 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %mul.1 = mul i8 %50, %49
  %arrayidx6.1 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next
  %51 = call i8 @__xorshift8(ptr @seed)
  store i8 %51, ptr %2, align 1
  %xor2 = xor i8 %51, %mul.1
  store i8 %xor2, ptr %arrayidx6.1, align 1, !tbaa !7
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds i8, ptr %public, i64 %indvars.iv.next.1
  %52 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %arrayidx2.2 = getelementptr inbounds i8, ptr %private, i64 %indvars.iv.next.1
  %53 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %mul.2 = mul i8 %53, %52
  %arrayidx6.2 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next.1
  %54 = call i8 @__xorshift8(ptr @seed)
  store i8 %54, ptr %3, align 1
  %xor3 = xor i8 %54, %mul.2
  store i8 %xor3, ptr %arrayidx6.2, align 1, !tbaa !7
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds i8, ptr %public, i64 %indvars.iv.next.2
  %55 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %arrayidx2.3 = getelementptr inbounds i8, ptr %private, i64 %indvars.iv.next.2
  %56 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %mul.3 = mul i8 %56, %55
  %arrayidx6.3 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next.2
  %57 = call i8 @__xorshift8(ptr @seed)
  store i8 %57, ptr %4, align 1
  %xor4 = xor i8 %57, %mul.3
  store i8 %xor4, ptr %arrayidx6.3, align 1, !tbaa !7
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.not.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.not.3, label %for.cond.cleanup, label %for.body, !llvm.loop !17
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local void @public_comp(ptr nocapture noundef %result, ptr nocapture noundef readonly %input1, ptr nocapture noundef readonly %input2, i32 noundef %size) local_unnamed_addr #1 {
entry:
  %0 = alloca i8, align 1
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %input244 = ptrtoint ptr %input2 to i64
  %input143 = ptrtoint ptr %input1 to i64
  %result42 = ptrtoint ptr %result to i64
  %cmp32 = icmp sgt i32 %size, 0
  br i1 %cmp32, label %iter.check, label %for.cond.cleanup11

iter.check:                                       ; preds = %entry
  %wide.trip.count = zext i32 %size to i64
  %min.iters.check = icmp ult i32 %size, 8
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %iter.check
  %6 = sub i64 %result42, %input143
  %diff.check = icmp ult i64 %6, 32
  %7 = sub i64 %result42, %input244
  %diff.check45 = icmp ult i64 %7, 32
  %conflict.rdx = or i1 %diff.check, %diff.check45
  br i1 %conflict.rdx, label %for.body.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %vector.memcheck
  %min.iters.check46 = icmp ult i32 %size, 32
  br i1 %min.iters.check46, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.vec = and i64 %wide.trip.count, 4294967264
  %8 = add nsw i64 %n.vec, -32
  %9 = lshr exact i64 %8, 5
  %10 = add nuw nsw i64 %9, 1
  %xtraiter = and i64 %10, 1
  %11 = icmp eq i64 %8, 0
  br i1 %11, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %10, 1152921504606846974
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.1, %vector.body ]
  %12 = getelementptr inbounds i8, ptr %input1, i64 %index
  %wide.load = load <16 x i8>, ptr %12, align 1, !tbaa !7
  %13 = getelementptr inbounds i8, ptr %12, i64 16
  %wide.load47 = load <16 x i8>, ptr %13, align 1, !tbaa !7
  %14 = getelementptr inbounds i8, ptr %input2, i64 %index
  %wide.load48 = load <16 x i8>, ptr %14, align 1, !tbaa !7
  %15 = getelementptr inbounds i8, ptr %14, i64 16
  %wide.load49 = load <16 x i8>, ptr %15, align 1, !tbaa !7
  %16 = mul <16 x i8> %wide.load48, %wide.load
  %17 = mul <16 x i8> %wide.load49, %wide.load47
  %18 = getelementptr inbounds i8, ptr %result, i64 %index
  store <16 x i8> %16, ptr %18, align 1, !tbaa !7
  %19 = getelementptr inbounds i8, ptr %18, i64 16
  store <16 x i8> %17, ptr %19, align 1, !tbaa !7
  %index.next = or i64 %index, 32
  %20 = getelementptr inbounds i8, ptr %input1, i64 %index.next
  %wide.load.1 = load <16 x i8>, ptr %20, align 1, !tbaa !7
  %21 = getelementptr inbounds i8, ptr %20, i64 16
  %wide.load47.1 = load <16 x i8>, ptr %21, align 1, !tbaa !7
  %22 = getelementptr inbounds i8, ptr %input2, i64 %index.next
  %wide.load48.1 = load <16 x i8>, ptr %22, align 1, !tbaa !7
  %23 = getelementptr inbounds i8, ptr %22, i64 16
  %wide.load49.1 = load <16 x i8>, ptr %23, align 1, !tbaa !7
  %24 = mul <16 x i8> %wide.load48.1, %wide.load.1
  %25 = mul <16 x i8> %wide.load49.1, %wide.load47.1
  %26 = getelementptr inbounds i8, ptr %result, i64 %index.next
  store <16 x i8> %24, ptr %26, align 1, !tbaa !7
  %27 = getelementptr inbounds i8, ptr %26, i64 16
  store <16 x i8> %25, ptr %27, align 1, !tbaa !7
  %index.next.1 = add nuw i64 %index, 64
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !18

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %28 = getelementptr inbounds i8, ptr %input1, i64 %index.unr
  %wide.load.epil = load <16 x i8>, ptr %28, align 1, !tbaa !7
  %29 = getelementptr inbounds i8, ptr %28, i64 16
  %wide.load47.epil = load <16 x i8>, ptr %29, align 1, !tbaa !7
  %30 = getelementptr inbounds i8, ptr %input2, i64 %index.unr
  %wide.load48.epil = load <16 x i8>, ptr %30, align 1, !tbaa !7
  %31 = getelementptr inbounds i8, ptr %30, i64 16
  %wide.load49.epil = load <16 x i8>, ptr %31, align 1, !tbaa !7
  %32 = mul <16 x i8> %wide.load48.epil, %wide.load.epil
  %33 = mul <16 x i8> %wide.load49.epil, %wide.load47.epil
  %34 = getelementptr inbounds i8, ptr %result, i64 %index.unr
  store <16 x i8> %32, ptr %34, align 1, !tbaa !7
  %35 = getelementptr inbounds i8, ptr %34, i64 16
  store <16 x i8> %33, ptr %35, align 1, !tbaa !7
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond8.preheader, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  %n.vec.remaining = and i64 %wide.trip.count, 24
  %min.epilog.iters.check = icmp eq i64 %n.vec.remaining, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %n.vec51 = and i64 %wide.trip.count, 4294967288
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %offset.idx = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next56, %vec.epilog.vector.body ]
  %36 = getelementptr inbounds i8, ptr %input1, i64 %offset.idx
  %wide.load54 = load <8 x i8>, ptr %36, align 1, !tbaa !7
  %37 = getelementptr inbounds i8, ptr %input2, i64 %offset.idx
  %wide.load55 = load <8 x i8>, ptr %37, align 1, !tbaa !7
  %38 = mul <8 x i8> %wide.load55, %wide.load54
  %39 = getelementptr inbounds i8, ptr %result, i64 %offset.idx
  store <8 x i8> %38, ptr %39, align 1, !tbaa !7
  %index.next56 = add nuw i64 %offset.idx, 8
  %40 = icmp eq i64 %index.next56, %n.vec51
  br i1 %40, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !19

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %cmp.n52 = icmp eq i64 %n.vec51, %wide.trip.count
  br i1 %cmp.n52, label %for.cond8.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %indvars.iv.ph = phi i64 [ 0, %iter.check ], [ 0, %vector.memcheck ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec51, %vec.epilog.middle.block ]
  %41 = xor i64 %indvars.iv.ph, -1
  %42 = add nsw i64 %41, %wide.trip.count
  %xtraiter91 = and i64 %wide.trip.count, 3
  %lcmp.mod92.not = icmp eq i64 %xtraiter91, 0
  br i1 %lcmp.mod92.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %indvars.iv.ph, %for.body.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body.prol ], [ 0, %for.body.preheader ]
  %arrayidx.prol = getelementptr inbounds i8, ptr %input1, i64 %indvars.iv.prol
  %43 = load i8, ptr %arrayidx.prol, align 1, !tbaa !7
  %arrayidx2.prol = getelementptr inbounds i8, ptr %input2, i64 %indvars.iv.prol
  %44 = load i8, ptr %arrayidx2.prol, align 1, !tbaa !7
  %mul.prol = mul i8 %44, %43
  %arrayidx6.prol = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.prol
  %45 = call i8 @__xorshift8(ptr @seed)
  store i8 %45, ptr %0, align 1
  %xor = xor i8 %45, %mul.prol
  store i8 %xor, ptr %arrayidx6.prol, align 1, !tbaa !7
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter91
  br i1 %prol.iter.cmp.not, label %for.body.prol.loopexit, label %for.body.prol, !llvm.loop !20

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %46 = icmp ult i64 %42, 3
  br i1 %46, label %for.cond8.preheader, label %for.body

for.cond8.preheader:                              ; preds = %for.body.prol.loopexit, %for.body, %vec.epilog.middle.block, %middle.block
  br i1 %cmp32, label %iter.check60, label %for.cond.cleanup11

iter.check60:                                     ; preds = %for.cond8.preheader
  %wide.trip.count40 = zext i32 %size to i64
  %min.iters.check58 = icmp ult i32 %size, 8
  br i1 %min.iters.check58, label %for.body12.preheader, label %vector.main.loop.iter.check62

vector.main.loop.iter.check62:                    ; preds = %iter.check60
  %min.iters.check61 = icmp ult i32 %size, 32
  br i1 %min.iters.check61, label %vec.epilog.ph77, label %vector.ph63

vector.ph63:                                      ; preds = %vector.main.loop.iter.check62
  %n.vec65 = and i64 %wide.trip.count, 4294967264
  %47 = add nsw i64 %n.vec65, -32
  %48 = lshr exact i64 %47, 5
  %49 = add nuw nsw i64 %48, 1
  %xtraiter93 = and i64 %49, 1
  %50 = icmp eq i64 %47, 0
  br i1 %50, label %middle.block57.unr-lcssa, label %vector.ph63.new

vector.ph63.new:                                  ; preds = %vector.ph63
  %unroll_iter95 = and i64 %49, 1152921504606846974
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67, %vector.ph63.new
  %index68 = phi i64 [ 0, %vector.ph63.new ], [ %index.next73.1, %vector.body67 ]
  %niter96 = phi i64 [ 0, %vector.ph63.new ], [ %niter96.next.1, %vector.body67 ]
  %51 = getelementptr inbounds [4 x i8], ptr @__const.public_comp.r, i64 0, i64 %index68
  %wide.load69 = load <16 x i8>, ptr %51, align 1, !tbaa !7
  %52 = getelementptr inbounds i8, ptr %51, i64 16
  %wide.load70 = load <16 x i8>, ptr %52, align 1, !tbaa !7
  %53 = getelementptr inbounds i8, ptr %result, i64 %index68
  %wide.load71 = load <16 x i8>, ptr %53, align 1, !tbaa !7
  %54 = getelementptr inbounds i8, ptr %53, i64 16
  %wide.load72 = load <16 x i8>, ptr %54, align 1, !tbaa !7
  %55 = add <16 x i8> %wide.load71, %wide.load69
  %56 = add <16 x i8> %wide.load72, %wide.load70
  store <16 x i8> %55, ptr %53, align 1, !tbaa !7
  store <16 x i8> %56, ptr %54, align 1, !tbaa !7
  %index.next73 = or i64 %index68, 32
  %57 = getelementptr inbounds [4 x i8], ptr @__const.public_comp.r, i64 0, i64 %index.next73
  %wide.load69.1 = load <16 x i8>, ptr %57, align 1, !tbaa !7
  %58 = getelementptr inbounds i8, ptr %57, i64 16
  %wide.load70.1 = load <16 x i8>, ptr %58, align 1, !tbaa !7
  %59 = getelementptr inbounds i8, ptr %result, i64 %index.next73
  %wide.load71.1 = load <16 x i8>, ptr %59, align 1, !tbaa !7
  %60 = getelementptr inbounds i8, ptr %59, i64 16
  %wide.load72.1 = load <16 x i8>, ptr %60, align 1, !tbaa !7
  %61 = add <16 x i8> %wide.load71.1, %wide.load69.1
  %62 = add <16 x i8> %wide.load72.1, %wide.load70.1
  store <16 x i8> %61, ptr %59, align 1, !tbaa !7
  store <16 x i8> %62, ptr %60, align 1, !tbaa !7
  %index.next73.1 = add nuw i64 %index68, 64
  %niter96.next.1 = add i64 %niter96, 2
  %niter96.ncmp.1 = icmp eq i64 %niter96.next.1, %unroll_iter95
  br i1 %niter96.ncmp.1, label %middle.block57.unr-lcssa, label %vector.body67, !llvm.loop !21

middle.block57.unr-lcssa:                         ; preds = %vector.body67, %vector.ph63
  %index68.unr = phi i64 [ 0, %vector.ph63 ], [ %index.next73.1, %vector.body67 ]
  %lcmp.mod94.not = icmp eq i64 %xtraiter93, 0
  br i1 %lcmp.mod94.not, label %middle.block57, label %vector.body67.epil

vector.body67.epil:                               ; preds = %middle.block57.unr-lcssa
  %63 = getelementptr inbounds [4 x i8], ptr @__const.public_comp.r, i64 0, i64 %index68.unr
  %wide.load69.epil = load <16 x i8>, ptr %63, align 1, !tbaa !7
  %64 = getelementptr inbounds i8, ptr %63, i64 16
  %wide.load70.epil = load <16 x i8>, ptr %64, align 1, !tbaa !7
  %65 = getelementptr inbounds i8, ptr %result, i64 %index68.unr
  %wide.load71.epil = load <16 x i8>, ptr %65, align 1, !tbaa !7
  %66 = getelementptr inbounds i8, ptr %65, i64 16
  %wide.load72.epil = load <16 x i8>, ptr %66, align 1, !tbaa !7
  %67 = add <16 x i8> %wide.load71.epil, %wide.load69.epil
  %68 = add <16 x i8> %wide.load72.epil, %wide.load70.epil
  store <16 x i8> %67, ptr %65, align 1, !tbaa !7
  store <16 x i8> %68, ptr %66, align 1, !tbaa !7
  br label %middle.block57

middle.block57:                                   ; preds = %middle.block57.unr-lcssa, %vector.body67.epil
  %cmp.n66 = icmp eq i64 %n.vec65, %wide.trip.count
  br i1 %cmp.n66, label %for.cond.cleanup11, label %vec.epilog.iter.check76

vec.epilog.iter.check76:                          ; preds = %middle.block57
  %n.vec.remaining78 = and i64 %wide.trip.count, 24
  %min.epilog.iters.check79 = icmp eq i64 %n.vec.remaining78, 0
  br i1 %min.epilog.iters.check79, label %for.body12.preheader, label %vec.epilog.ph77

vec.epilog.ph77:                                  ; preds = %vector.main.loop.iter.check62, %vec.epilog.iter.check76
  %vec.epilog.resume.val80 = phi i64 [ %n.vec65, %vec.epilog.iter.check76 ], [ 0, %vector.main.loop.iter.check62 ]
  %n.vec82 = and i64 %wide.trip.count, 4294967288
  br label %vec.epilog.vector.body85

vec.epilog.vector.body85:                         ; preds = %vec.epilog.vector.body85, %vec.epilog.ph77
  %offset.idx87 = phi i64 [ %vec.epilog.resume.val80, %vec.epilog.ph77 ], [ %index.next90, %vec.epilog.vector.body85 ]
  %69 = getelementptr inbounds [4 x i8], ptr @__const.public_comp.r, i64 0, i64 %offset.idx87
  %wide.load88 = load <8 x i8>, ptr %69, align 1, !tbaa !7
  %70 = getelementptr inbounds i8, ptr %result, i64 %offset.idx87
  %wide.load89 = load <8 x i8>, ptr %70, align 1, !tbaa !7
  %71 = add <8 x i8> %wide.load89, %wide.load88
  store <8 x i8> %71, ptr %70, align 1, !tbaa !7
  %index.next90 = add nuw i64 %offset.idx87, 8
  %72 = icmp eq i64 %index.next90, %n.vec82
  br i1 %72, label %vec.epilog.middle.block74, label %vec.epilog.vector.body85, !llvm.loop !22

vec.epilog.middle.block74:                        ; preds = %vec.epilog.vector.body85
  %cmp.n84 = icmp eq i64 %n.vec82, %wide.trip.count
  br i1 %cmp.n84, label %for.cond.cleanup11, label %for.body12.preheader

for.body12.preheader:                             ; preds = %iter.check60, %vec.epilog.iter.check76, %vec.epilog.middle.block74
  %indvars.iv37.ph = phi i64 [ 0, %iter.check60 ], [ %n.vec65, %vec.epilog.iter.check76 ], [ %n.vec82, %vec.epilog.middle.block74 ]
  br label %for.body12

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  %arrayidx = getelementptr inbounds i8, ptr %input1, i64 %indvars.iv
  %73 = load i8, ptr %arrayidx, align 1, !tbaa !7
  %arrayidx2 = getelementptr inbounds i8, ptr %input2, i64 %indvars.iv
  %74 = load i8, ptr %arrayidx2, align 1, !tbaa !7
  %mul = mul i8 %74, %73
  %arrayidx6 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv
  %75 = call i8 @__xorshift8(ptr @seed)
  store i8 %75, ptr %1, align 1
  %xor1 = xor i8 %75, %mul
  store i8 %xor1, ptr %arrayidx6, align 1, !tbaa !7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds i8, ptr %input1, i64 %indvars.iv.next
  %76 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %arrayidx2.1 = getelementptr inbounds i8, ptr %input2, i64 %indvars.iv.next
  %77 = load i8, ptr %arrayidx2.1, align 1, !tbaa !7
  %mul.1 = mul i8 %77, %76
  %arrayidx6.1 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next
  %78 = call i8 @__xorshift8(ptr @seed)
  store i8 %78, ptr %2, align 1
  %xor2 = xor i8 %78, %mul.1
  store i8 %xor2, ptr %arrayidx6.1, align 1, !tbaa !7
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds i8, ptr %input1, i64 %indvars.iv.next.1
  %79 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %arrayidx2.2 = getelementptr inbounds i8, ptr %input2, i64 %indvars.iv.next.1
  %80 = load i8, ptr %arrayidx2.2, align 1, !tbaa !7
  %mul.2 = mul i8 %80, %79
  %arrayidx6.2 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next.1
  %81 = call i8 @__xorshift8(ptr @seed)
  store i8 %81, ptr %3, align 1
  %xor3 = xor i8 %81, %mul.2
  store i8 %xor3, ptr %arrayidx6.2, align 1, !tbaa !7
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds i8, ptr %input1, i64 %indvars.iv.next.2
  %82 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %arrayidx2.3 = getelementptr inbounds i8, ptr %input2, i64 %indvars.iv.next.2
  %83 = load i8, ptr %arrayidx2.3, align 1, !tbaa !7
  %mul.3 = mul i8 %83, %82
  %arrayidx6.3 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv.next.2
  %84 = call i8 @__xorshift8(ptr @seed)
  store i8 %84, ptr %4, align 1
  %xor4 = xor i8 %84, %mul.3
  store i8 %xor4, ptr %arrayidx6.3, align 1, !tbaa !7
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.not.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.not.3, label %for.cond8.preheader, label %for.body, !llvm.loop !23

for.cond.cleanup11:                               ; preds = %for.body12, %middle.block57, %vec.epilog.middle.block74, %entry, %for.cond8.preheader
  ret void

for.body12:                                       ; preds = %for.body12.preheader, %for.body12
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.body12 ], [ %indvars.iv37.ph, %for.body12.preheader ]
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr @__const.public_comp.r, i64 0, i64 %indvars.iv37
  %85 = load i8, ptr %arrayidx14, align 1, !tbaa !7
  %arrayidx17 = getelementptr inbounds i8, ptr %result, i64 %indvars.iv37
  %86 = load i8, ptr %arrayidx17, align 1, !tbaa !7
  %add = add i8 %86, %85
  %87 = call i8 @__xorshift8(ptr @seed)
  store i8 %87, ptr %5, align 1
  %xor5 = xor i8 %87, %add
  store i8 %xor5, ptr %arrayidx17, align 1, !tbaa !7
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond41.not = icmp eq i64 %indvars.iv.next38, %wide.trip.count40
  br i1 %exitcond41.not, label %for.cond.cleanup11, label %for.body12, !llvm.loop !24
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_char(ptr nocapture noundef readonly %input) local_unnamed_addr #2 {
entry:
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 0)
  %0 = load i8, ptr %input, align 1, !tbaa !7
  %conv2 = sext i8 %0 to i32
  %putchar = tail call i32 @putchar(i32 %conv2)
  %call.1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 1)
  %arrayidx.1 = getelementptr inbounds i8, ptr %input, i64 1
  %1 = load i8, ptr %arrayidx.1, align 1, !tbaa !7
  %conv2.1 = sext i8 %1 to i32
  %putchar.1 = tail call i32 @putchar(i32 %conv2.1)
  %call.2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 2)
  %arrayidx.2 = getelementptr inbounds i8, ptr %input, i64 2
  %2 = load i8, ptr %arrayidx.2, align 1, !tbaa !7
  %conv2.2 = sext i8 %2 to i32
  %putchar.2 = tail call i32 @putchar(i32 %conv2.2)
  %call.3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 3)
  %arrayidx.3 = getelementptr inbounds i8, ptr %input, i64 3
  %3 = load i8, ptr %arrayidx.3, align 1, !tbaa !7
  %conv2.3 = sext i8 %3 to i32
  %putchar.3 = tail call i32 @putchar(i32 %conv2.3)
  %call.4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 4)
  %arrayidx.4 = getelementptr inbounds i8, ptr %input, i64 4
  %4 = load i8, ptr %arrayidx.4, align 1, !tbaa !7
  %conv2.4 = sext i8 %4 to i32
  %putchar.4 = tail call i32 @putchar(i32 %conv2.4)
  %call.5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 5)
  %arrayidx.5 = getelementptr inbounds i8, ptr %input, i64 5
  %5 = load i8, ptr %arrayidx.5, align 1, !tbaa !7
  %conv2.5 = sext i8 %5 to i32
  %putchar.5 = tail call i32 @putchar(i32 %conv2.5)
  %call.6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 6)
  %arrayidx.6 = getelementptr inbounds i8, ptr %input, i64 6
  %6 = load i8, ptr %arrayidx.6, align 1, !tbaa !7
  %conv2.6 = sext i8 %6 to i32
  %putchar.6 = tail call i32 @putchar(i32 %conv2.6)
  %call.7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, i32 noundef 7)
  %arrayidx.7 = getelementptr inbounds i8, ptr %input, i64 7
  %7 = load i8, ptr %arrayidx.7, align 1, !tbaa !7
  %conv2.7 = sext i8 %7 to i32
  %putchar.7 = tail call i32 @putchar(i32 %conv2.7)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
entry:
  tail call void @classify(ptr poison, i32 poison)
  tail call void @classify(ptr poison, i32 poison)
  %call29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2)
  %call37 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -21)
  %call37.1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -40)
  %call37.2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -89)
  %call37.3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -39)
  %putchar = tail call i32 @putchar(i32 10)
  %call42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5)
  %call52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 109)
  %call52.1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 112)
  %call52.2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 115)
  %call52.3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 118)
  %putchar84 = tail call i32 @putchar(i32 10)
  %call57 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.6)
  %call67 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 19)
  %call67.1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -64)
  %call67.2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef 65)
  %call67.3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3, i32 noundef -20)
  %putchar85 = tail call i32 @putchar(i32 10)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #5

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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 15.0.6"}
!5 = !{i64 221}
!6 = !{i64 389}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !11, !12, !14}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !11, !12}
!18 = distinct !{!18, !11, !12}
!19 = distinct !{!19, !11, !12, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !11, !12}
!22 = distinct !{!22, !11, !12, !14}
!23 = distinct !{!23, !11, !12}
!24 = distinct !{!24, !11, !14, !12}
