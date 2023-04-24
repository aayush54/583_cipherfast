; ModuleID = 'toy_cipherfix.bc'
source_filename = "toy_cipherfix.out"

@rodata_15 = private unnamed_addr constant [104 x i8] c"\01\00\02\00%i\00%c\00done\0A\00abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\00\00\0C\B8dV\A7:U\D1\90\1B\BD\0BL\FF\13m\0A\0B\0C\0D\11\223D", align 16, !ROData_SecInfo !0

define dso_local void @classify(i64 %arg1, i32 %arg2) {
entry:
  %stktop_4 = alloca i8, i32 20, align 1
  %tos = ptrtoint ptr %stktop_4 to i64
  %0 = add i64 %tos, 12
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  store i32 %arg2, ptr %stktop_4, align 1
  ret void
}

define dso_local void @declassify(i64 %arg1, i32 %arg2) {
entry:
  %stktop_4 = alloca i8, i32 20, align 1
  %tos = ptrtoint ptr %stktop_4 to i64
  %0 = add i64 %tos, 12
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  store i32 %arg2, ptr %stktop_4, align 1
  ret void
}

define dso_local void @secret_comp(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %arg5, i64 %arg6) {
entry:
  %stktop_4 = alloca i8, i32 60, align 1
  %tos = ptrtoint ptr %stktop_4 to i64
  %0 = add i64 %tos, 12
  %RBP_N.48 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.40 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.32 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 36
  %RBP_N.24 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 44
  %RBP_N.16 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 52
  %RBP_N.8 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  store i64 %arg2, ptr %RBP_N.16, align 1
  store i64 %arg3, ptr %RBP_N.24, align 1
  store i64 %arg4, ptr %RBP_N.32, align 1
  store i64 %arg5, ptr %RBP_N.40, align 1
  store i64 %arg6, ptr %RBP_N.48, align 1
  store i32 0, ptr %stktop_4, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %7 = load i32, ptr %stktop_4, align 1
  %8 = zext i32 %7 to i64
  %9 = zext i32 4 to i64
  %10 = sub i64 %8, %9
  %11 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %8, i64 %9)
  %CF = extractvalue { i64, i1 } %11, 1
  %ZF = icmp eq i64 %10, 0
  %highbit = and i64 -9223372036854775808, %10
  %SF = icmp ne i64 %highbit, 0
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 %9)
  %OF = extractvalue { i64, i1 } %12, 1
  %13 = and i64 %10, 255
  %14 = call i64 @llvm.ctpop.i64(i64 %13)
  %15 = and i64 %14, 1
  %PF = icmp eq i64 %15, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload = load i64, ptr %RBP_N.8, align 1
  %memload1 = load i64, ptr %stktop_4, align 1
  %16 = trunc i64 %memload1 to i32
  %RCX = sext i32 %16 to i64
  %memref-basereg = add i64 %memload, %RCX
  %17 = inttoptr i64 %memref-basereg to ptr
  %memload2 = load i32, ptr %17, align 1
  %18 = trunc i32 %memload2 to i8
  %EDX = sext i8 %18 to i32
  %memload3 = load i64, ptr %RBP_N.16, align 1
  %memload4 = load i64, ptr %stktop_4, align 1
  %19 = trunc i64 %memload4 to i32
  %RCX5 = sext i32 %19 to i64
  %memref-basereg6 = add i64 %memload3, %RCX5
  %20 = inttoptr i64 %memref-basereg6 to ptr
  %memload7 = load i32, ptr %20, align 1
  %21 = trunc i32 %memload7 to i8
  %ESI = sext i8 %21 to i32
  %EDX11 = add nsw i32 %EDX, %ESI
  %highbit8 = and i32 -2147483648, %EDX11
  %SF9 = icmp ne i32 %highbit8, 0
  %ZF10 = icmp eq i32 %EDX11, 0
  %memload12 = load i64, ptr %RBP_N.24, align 1
  %memload13 = load i64, ptr %stktop_4, align 1
  %22 = trunc i64 %memload13 to i32
  %RCX14 = sext i32 %22 to i64
  %memref-basereg15 = add i64 %memload12, %RCX14
  %23 = trunc i32 %EDX11 to i8
  %24 = inttoptr i64 %memref-basereg15 to ptr
  store i8 %23, ptr %24, align 1
  %memload16 = load i64, ptr %RBP_N.8, align 1
  %memload17 = load i64, ptr %stktop_4, align 1
  %25 = trunc i64 %memload17 to i32
  %RCX18 = sext i32 %25 to i64
  %memref-basereg19 = add i64 %memload16, %RCX18
  %26 = inttoptr i64 %memref-basereg19 to ptr
  %memload20 = load i32, ptr %26, align 1
  %27 = trunc i32 %memload20 to i8
  %ESI21 = sext i8 %27 to i32
  %memload22 = load i64, ptr %RBP_N.16, align 1
  %memload23 = load i64, ptr %stktop_4, align 1
  %28 = trunc i64 %memload23 to i32
  %RCX24 = sext i32 %28 to i64
  %memref-basereg25 = add i64 %memload22, %RCX24
  %29 = inttoptr i64 %memref-basereg25 to ptr
  %memload26 = load i32, ptr %29, align 1
  %30 = trunc i32 %memload26 to i8
  %EDI = sext i8 %30 to i32
  %ESI27 = mul nsw i32 %ESI21, %EDI
  %memload28 = load i64, ptr %RBP_N.32, align 1
  %memload29 = load i64, ptr %stktop_4, align 1
  %31 = trunc i64 %memload29 to i32
  %RCX30 = sext i32 %31 to i64
  %memref-basereg31 = add i64 %memload28, %RCX30
  %32 = trunc i32 %ESI27 to i8
  %33 = inttoptr i64 %memref-basereg31 to ptr
  store i8 %32, ptr %33, align 1
  %memload32 = load i64, ptr %RBP_N.8, align 1
  %memload33 = load i64, ptr %stktop_4, align 1
  %34 = trunc i64 %memload33 to i32
  %RCX34 = sext i32 %34 to i64
  %memref-basereg35 = add i64 %memload32, %RCX34
  %35 = inttoptr i64 %memref-basereg35 to ptr
  %memload36 = load i32, ptr %35, align 1
  %36 = trunc i32 %memload36 to i8
  %EDI37 = sext i8 %36 to i32
  %memload38 = load i64, ptr %RBP_N.16, align 1
  %memload39 = load i64, ptr %stktop_4, align 1
  %37 = trunc i64 %memload39 to i32
  %RCX40 = sext i32 %37 to i64
  %memref-basereg41 = add i64 %memload38, %RCX40
  %38 = inttoptr i64 %memref-basereg41 to ptr
  %memload42 = load i32, ptr %38, align 1
  %39 = trunc i32 %memload42 to i8
  %R8D = sext i8 %39 to i32
  %EDI43 = sub i32 %EDI37, %R8D
  %40 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %EDI37, i32 %R8D)
  %CF44 = extractvalue { i32, i1 } %40, 1
  %ZF45 = icmp eq i32 %EDI43, 0
  %highbit46 = and i32 -2147483648, %EDI43
  %SF47 = icmp ne i32 %highbit46, 0
  %41 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %EDI37, i32 %R8D)
  %OF48 = extractvalue { i32, i1 } %41, 1
  %42 = and i32 %EDI43, 255
  %43 = call i32 @llvm.ctpop.i32(i32 %42)
  %44 = and i32 %43, 1
  %PF49 = icmp eq i32 %44, 0
  %memload50 = load i64, ptr %RBP_N.40, align 1
  %memload51 = load i64, ptr %stktop_4, align 1
  %45 = trunc i64 %memload51 to i32
  %RCX52 = sext i32 %45 to i64
  %memref-basereg53 = add i64 %memload50, %RCX52
  %46 = trunc i32 %EDI43 to i8
  %47 = inttoptr i64 %memref-basereg53 to ptr
  store i8 %46, ptr %47, align 1
  %memload54 = load i64, ptr %RBP_N.8, align 1
  %memload55 = load i64, ptr %stktop_4, align 1
  %48 = trunc i64 %memload55 to i32
  %RCX56 = sext i32 %48 to i64
  %memref-basereg57 = add i64 %memload54, %RCX56
  %49 = inttoptr i64 %memref-basereg57 to ptr
  %memload58 = load i32, ptr %49, align 1
  %50 = trunc i32 %memload58 to i8
  %EAX = sext i8 %50 to i32
  %memload59 = load i64, ptr %RBP_N.16, align 1
  %memload60 = load i64, ptr %stktop_4, align 1
  %51 = trunc i64 %memload60 to i32
  %R9 = sext i32 %51 to i64
  %memref-basereg61 = add i64 %memload59, %R9
  %52 = inttoptr i64 %memref-basereg61 to ptr
  %memload62 = load i32, ptr %52, align 1
  %53 = trunc i32 %memload62 to i8
  %R8D63 = sext i8 %53 to i32
  %54 = sext i32 %EAX to i64
  %55 = lshr i64 %54, 32
  %EDX64 = trunc i64 %55 to i32
  %56 = sext i32 %EAX to i64
  %57 = sext i32 %EDX64 to i64
  %div_hb_ls = shl nuw i64 %57, 32
  %dividend = or i64 %div_hb_ls, %56
  %58 = sext i32 %R8D63 to i64
  %div_q = sdiv i64 %dividend, %58
  %EAX65 = trunc i64 %div_q to i32
  %div_r = srem i64 %dividend, %58
  %EDX66 = trunc i64 %div_r to i32
  %memload67 = load i64, ptr %RBP_N.48, align 1
  %memload68 = load i64, ptr %stktop_4, align 1
  %59 = trunc i64 %memload68 to i32
  %R969 = sext i32 %59 to i64
  %memref-basereg70 = add i64 %memload67, %R969
  %60 = trunc i32 %EDX66 to i8
  %61 = inttoptr i64 %memref-basereg70 to ptr
  store i8 %60, ptr %61, align 1
  %memload71 = load i32, ptr %stktop_4, align 1
  %EAX78 = add i32 %memload71, 1
  %62 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload71, i32 1)
  %CF72 = extractvalue { i32, i1 } %62, 1
  %63 = and i32 %EAX78, 255
  %64 = call i32 @llvm.ctpop.i32(i32 %63)
  %65 = and i32 %64, 1
  %PF73 = icmp eq i32 %65, 0
  %ZF74 = icmp eq i32 %EAX78, 0
  %highbit75 = and i32 -2147483648, %EAX78
  %SF76 = icmp ne i32 %highbit75, 0
  %66 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload71, i32 1)
  %OF77 = extractvalue { i32, i1 } %66, 1
  store i32 %EAX78, ptr %stktop_4, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  ret void
}

define dso_local i32 @mix_comp(i64 %arg1, i64 %arg2, i64 %arg3, i32 %arg4) {
entry:
  %stktop_4 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_4 to i64
  %0 = add i64 %tos, 12
  %RBP_N.28 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 16
  %RBP_N.24 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.16 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.8 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %4 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  store i64 %arg2, ptr %RBP_N.16, align 1
  store i64 %arg3, ptr %RBP_N.24, align 1
  store i32 %arg4, ptr %RBP_N.28, align 1
  store i32 0, ptr %stktop_4, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %memload = load i32, ptr %stktop_4, align 1
  %5 = load i32, ptr %RBP_N.28, align 1
  %6 = sub i32 %memload, %5
  %7 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload, i32 %5)
  %CF = extractvalue { i32, i1 } %7, 1
  %ZF = icmp eq i32 %6, 0
  %highbit = and i32 -2147483648, %6
  %SF = icmp ne i32 %highbit, 0
  %8 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload, i32 %5)
  %OF = extractvalue { i32, i1 } %8, 1
  %9 = and i32 %6, 255
  %10 = call i32 @llvm.ctpop.i32(i32 %9)
  %11 = and i32 %10, 1
  %PF = icmp eq i32 %11, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload1 = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr %stktop_4, align 1
  %12 = trunc i64 %memload2 to i32
  %RCX = sext i32 %12 to i64
  %memref-basereg = add i64 %memload1, %RCX
  %13 = inttoptr i64 %memref-basereg to ptr
  %memload3 = load i32, ptr %13, align 1
  %14 = trunc i32 %memload3 to i8
  %EDX = sext i8 %14 to i32
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %memload5 = load i64, ptr %stktop_4, align 1
  %15 = trunc i64 %memload5 to i32
  %RCX6 = sext i32 %15 to i64
  %memref-basereg7 = add i64 %memload4, %RCX6
  %16 = inttoptr i64 %memref-basereg7 to ptr
  %memload8 = load i32, ptr %16, align 1
  %17 = trunc i32 %memload8 to i8
  %ESI = sext i8 %17 to i32
  %EDX9 = mul nsw i32 %EDX, %ESI
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %memload11 = load i64, ptr %stktop_4, align 1
  %18 = trunc i64 %memload11 to i32
  %RCX12 = sext i32 %18 to i64
  %memref-basereg13 = add i64 %memload10, %RCX12
  %19 = trunc i32 %EDX9 to i8
  %20 = inttoptr i64 %memref-basereg13 to ptr
  store i8 %19, ptr %20, align 1
  %memload14 = load i32, ptr %stktop_4, align 1
  %EAX = add i32 %memload14, 1
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %21, 1
  %22 = and i32 %EAX, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %22)
  %24 = and i32 %23, 1
  %PF16 = icmp eq i32 %24, 0
  %ZF17 = icmp eq i32 %EAX, 0
  %highbit18 = and i32 -2147483648, %EAX
  %SF19 = icmp ne i32 %highbit18, 0
  %25 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %25, 1
  store i32 %EAX, ptr %stktop_4, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  ret i32 %memload
}

define dso_local i32 @public_comp(i64 %arg1, i64 %arg2, i64 %arg3, i32 %arg4) {
entry:
  %stktop_4 = alloca i8, i32 48, align 1
  %tos = ptrtoint ptr %stktop_4 to i64
  %0 = add i64 %tos, 12
  %RBP_N.36 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 16
  %RBP_N.32 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 20
  %RBP_N.28 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 24
  %RBP_N.24 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 32
  %RBP_N.16 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 40
  %RBP_N.8 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %6 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  store i64 %arg2, ptr %RBP_N.16, align 1
  store i64 %arg3, ptr %RBP_N.24, align 1
  store i32 %arg4, ptr %RBP_N.28, align 1
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %memload = load i32, ptr %RBP_N.36, align 1
  %7 = load i32, ptr %RBP_N.28, align 1
  %8 = sub i32 %memload, %7
  %9 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload, i32 %7)
  %CF = extractvalue { i32, i1 } %9, 1
  %ZF = icmp eq i32 %8, 0
  %highbit = and i32 -2147483648, %8
  %SF = icmp ne i32 %highbit, 0
  %10 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload, i32 %7)
  %OF = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %8, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF = icmp eq i32 %13, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload1 = load i64, ptr %RBP_N.16, align 1
  %memload2 = load i64, ptr %RBP_N.36, align 1
  %14 = trunc i64 %memload2 to i32
  %RCX = sext i32 %14 to i64
  %memref-basereg = add i64 %memload1, %RCX
  %15 = inttoptr i64 %memref-basereg to ptr
  %memload3 = load i32, ptr %15, align 1
  %16 = trunc i32 %memload3 to i8
  %EDX = sext i8 %16 to i32
  %memload4 = load i64, ptr %RBP_N.24, align 1
  %memload5 = load i64, ptr %RBP_N.36, align 1
  %17 = trunc i64 %memload5 to i32
  %RCX6 = sext i32 %17 to i64
  %memref-basereg7 = add i64 %memload4, %RCX6
  %18 = inttoptr i64 %memref-basereg7 to ptr
  %memload8 = load i32, ptr %18, align 1
  %19 = trunc i32 %memload8 to i8
  %ESI = sext i8 %19 to i32
  %EDX9 = mul nsw i32 %EDX, %ESI
  %memload10 = load i64, ptr %RBP_N.8, align 1
  %memload11 = load i64, ptr %RBP_N.36, align 1
  %20 = trunc i64 %memload11 to i32
  %RCX12 = sext i32 %20 to i64
  %memref-basereg13 = add i64 %memload10, %RCX12
  %21 = trunc i32 %EDX9 to i8
  %22 = inttoptr i64 %memref-basereg13 to ptr
  store i8 %21, ptr %22, align 1
  %memload14 = load i32, ptr %RBP_N.36, align 1
  %EAX = add i32 %memload14, 1
  %23 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload14, i32 1)
  %CF15 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %EAX, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF16 = icmp eq i32 %26, 0
  %ZF17 = icmp eq i32 %EAX, 0
  %highbit18 = and i32 -2147483648, %EAX
  %SF19 = icmp ne i32 %highbit18, 0
  %27 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload14, i32 1)
  %OF20 = extractvalue { i32, i1 } %27, 1
  store i32 %EAX, ptr %RBP_N.36, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  store i32 0, ptr %stktop_4, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.5, %bb.3
  %memload21 = load i32, ptr %stktop_4, align 1
  %28 = load i32, ptr %RBP_N.28, align 1
  %29 = sub i32 %memload21, %28
  %30 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload21, i32 %28)
  %CF22 = extractvalue { i32, i1 } %30, 1
  %ZF23 = icmp eq i32 %29, 0
  %highbit24 = and i32 -2147483648, %29
  %SF25 = icmp ne i32 %highbit24, 0
  %31 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload21, i32 %28)
  %OF26 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %29, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF27 = icmp eq i32 %34, 0
  %CmpSFOF_JGE41 = icmp eq i1 %SF25, %OF26
  br i1 %CmpSFOF_JGE41, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload28 = load i64, ptr %stktop_4, align 1
  %35 = trunc i64 %memload28 to i32
  %RAX = sext i32 %35 to i64
  %36 = getelementptr i8, ptr %RBP_N.32, i64 %RAX
  %memload29 = load i8, ptr %36, align 1
  %memload30 = load i64, ptr %RBP_N.8, align 1
  %memload31 = load i64, ptr %stktop_4, align 1
  %37 = trunc i64 %memload31 to i32
  %RDX = sext i32 %37 to i64
  %memref-basereg32 = add i64 %memload30, %RDX
  %38 = inttoptr i64 %memref-basereg32 to ptr
  store i8 %memload29, ptr %38, align 1
  %memload33 = load i32, ptr %stktop_4, align 1
  %EAX40 = add i32 %memload33, 1
  %39 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload33, i32 1)
  %CF34 = extractvalue { i32, i1 } %39, 1
  %40 = and i32 %EAX40, 255
  %41 = call i32 @llvm.ctpop.i32(i32 %40)
  %42 = and i32 %41, 1
  %PF35 = icmp eq i32 %42, 0
  %ZF36 = icmp eq i32 %EAX40, 0
  %highbit37 = and i32 -2147483648, %EAX40
  %SF38 = icmp ne i32 %highbit37, 0
  %43 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload33, i32 1)
  %OF39 = extractvalue { i32, i1 } %43, 1
  store i32 %EAX40, ptr %stktop_4, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  ret i32 %memload21
}

declare dso_local i32 @printf(ptr, ...)

define dso_local i64 @print_char(i64 %arg1) {
entry:
  %stktop_8 = alloca i8, i32 24, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.8 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %1 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 %arg1, ptr %RBP_N.8, align 1
  %2 = ptrtoint ptr %stktop_8 to i64
  %3 = add i64 %2, 4
  %4 = inttoptr i64 %3 to ptr
  store i32 0, ptr %4, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %5 = ptrtoint ptr %stktop_8 to i64
  %6 = add i64 %5, 4
  %7 = inttoptr i64 %6 to ptr
  %memload = load i64, ptr %7, align 1
  %8 = trunc i64 %memload to i32
  %RAX = sext i32 %8 to i64
  %9 = sub i64 %RAX, 8
  %10 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %RAX, i64 8)
  %CF = extractvalue { i64, i1 } %10, 1
  %ZF = icmp eq i64 %9, 0
  %highbit = and i64 -9223372036854775808, %9
  %SF = icmp ne i64 %highbit, 0
  %11 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %RAX, i64 8)
  %OF = extractvalue { i64, i1 } %11, 1
  %12 = and i64 %9, 255
  %13 = call i64 @llvm.ctpop.i64(i64 %12)
  %14 = and i64 %13, 1
  %PF = icmp eq i64 %14, 0
  %CFCmp_JAE = icmp eq i1 %CF, false
  br i1 %CFCmp_JAE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %15 = ptrtoint ptr %stktop_8 to i64
  %16 = add i64 %15, 4
  %17 = inttoptr i64 %16 to ptr
  %memload1 = load i32, ptr %17, align 1
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 4), i32 %memload1)
  %memload2 = load i64, ptr %RBP_N.8, align 1
  %18 = ptrtoint ptr %stktop_8 to i64
  %19 = add i64 %18, 4
  %20 = inttoptr i64 %19 to ptr
  %memload3 = load i64, ptr %20, align 1
  %21 = trunc i64 %memload3 to i32
  %RDX = sext i32 %21 to i64
  %memref-basereg = add i64 %memload2, %RDX
  %22 = inttoptr i64 %memref-basereg to ptr
  %memload4 = load i32, ptr %22, align 1
  %23 = trunc i32 %memload4 to i8
  %ESI = sext i8 %23 to i32
  store i32 %EAX, ptr %stktop_8, align 1
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 7), i32 %ESI, i64 %RDX, i64 %memload2)
  %24 = ptrtoint ptr %stktop_8 to i64
  %25 = add i64 %24, 4
  %26 = inttoptr i64 %25 to ptr
  %memload6 = load i32, ptr %26, align 1
  %EAX13 = add i32 %memload6, 1
  %27 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload6, i32 1)
  %CF7 = extractvalue { i32, i1 } %27, 1
  %28 = and i32 %EAX13, 255
  %29 = call i32 @llvm.ctpop.i32(i32 %28)
  %30 = and i32 %29, 1
  %PF8 = icmp eq i32 %30, 0
  %ZF9 = icmp eq i32 %EAX13, 0
  %highbit10 = and i32 -2147483648, %EAX13
  %SF11 = icmp ne i32 %highbit10, 0
  %31 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload6, i32 1)
  %OF12 = extractvalue { i32, i1 } %31, 1
  %32 = ptrtoint ptr %stktop_8 to i64
  %33 = add i64 %32, 4
  %34 = inttoptr i64 %33 to ptr
  store i32 %EAX13, ptr %34, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  ret i64 %RAX
}

declare dso_local ptr @memset(ptr, i32, i64)

declare dso_local ptr @memcpy(ptr, ptr, i64)

declare dso_local ptr @malloc(i64)

define dso_local i32 @main() {
entry:
  %EAX-SKT-LOC = alloca i64, align 8
  %stktop_8 = alloca i8, i32 216, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.196 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 24
  %RBP_N.192 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 28
  %RBP_N.188 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 32
  %RBP_N.184 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 40
  %RBP_N.176 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 48
  %RBP_N.168 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 56
  %RBP_N.160 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 64
  %RBP_N.152 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 72
  %RBP_N.144 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 80
  %RBP_N.136 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 88
  %RBP_N.128 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 96
  %RBP_N.120 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 116
  %RBP_N.100 = inttoptr i64 %12 to ptr
  %13 = add i64 %tos, 120
  %14 = inttoptr i64 %13 to ptr
  %15 = add i64 %tos, 184
  %16 = inttoptr i64 %15 to ptr
  %17 = add i64 %tos, 192
  %RBP_N.24 = inttoptr i64 %17 to ptr
  %18 = add i64 %tos, 196
  %RBP_N.20 = inttoptr i64 %18 to ptr
  %19 = add i64 %tos, 212
  %RBP_N.4 = inttoptr i64 %19 to ptr
  %20 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %20 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %21 = zext i32 16 to i64
  %22 = call ptr @memset(ptr %16, i32 0, i64 %21)
  %RAX1 = ptrtoint ptr %22 to i64
  %23 = zext i32 63 to i64
  %24 = call ptr @memcpy(ptr %14, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 16), i64 %23)
  %RAX3 = ptrtoint ptr %24 to i64
  store i32 0, ptr %RBP_N.100, align 1
  store i64 %RAX3, ptr %EAX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %bb.2, %entry
  %25 = load i32, ptr %RBP_N.100, align 1
  %26 = zext i32 %25 to i64
  %27 = zext i32 16 to i64
  %28 = sub i64 %26, %27
  %29 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %26, i64 %27)
  %CF = extractvalue { i64, i1 } %29, 1
  %ZF = icmp eq i64 %28, 0
  %highbit = and i64 -9223372036854775808, %28
  %SF = icmp ne i64 %highbit, 0
  %30 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %26, i64 %27)
  %OF = extractvalue { i64, i1 } %30, 1
  %31 = and i64 %28, 255
  %32 = call i64 @llvm.ctpop.i64(i64 %31)
  %33 = and i64 %32, 1
  %PF = icmp eq i64 %33, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %34 = load i64, ptr %EAX-SKT-LOC, align 1
  %EAX = trunc i64 %34 to i32
  %memload = load i32, ptr %RBP_N.100, align 1
  %EAX4 = mul i32 3, %memload
  %RCX = sext i32 %EAX4 to i64
  %35 = getelementptr i8, ptr %14, i64 %RCX
  %memload5 = load i8, ptr %35, align 1
  %memload6 = load i64, ptr %RBP_N.100, align 1
  %36 = trunc i64 %memload6 to i32
  %RCX7 = sext i32 %36 to i64
  %37 = getelementptr i8, ptr %16, i64 %RCX7
  store i8 %memload5, ptr %37, align 1
  %memload9 = load i32, ptr %RBP_N.100, align 1
  %EAX16 = add i32 %memload9, 1
  %38 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload9, i32 1)
  %CF10 = extractvalue { i32, i1 } %38, 1
  %39 = and i32 %EAX16, 255
  %40 = call i32 @llvm.ctpop.i32(i32 %39)
  %41 = and i32 %40, 1
  %PF11 = icmp eq i32 %41, 0
  %ZF12 = icmp eq i32 %EAX16, 0
  %highbit13 = and i32 -2147483648, %EAX16
  %SF14 = icmp ne i32 %highbit13, 0
  %42 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload9, i32 1)
  %OF15 = extractvalue { i32, i1 } %42, 1
  store i32 %EAX16, ptr %RBP_N.100, align 1
  %43 = zext i32 %EAX16 to i64
  store i64 %43, ptr %EAX-SKT-LOC, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RDI = ptrtoint ptr %16 to i64
  %memload17 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 80), align 1, !ROData_Content !1
  store i64 %memload17, ptr %RBP_N.128, align 1
  %memload18 = load i64, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 88), align 1, !ROData_Content !2
  store i64 %memload18, ptr %RBP_N.120, align 1
  call void @classify(i64 %RDI, i32 16)
  %RDI19 = ptrtoint ptr %RBP_N.128 to i64
  call void @classify(i64 %RDI19, i32 16)
  %44 = zext i32 4 to i64
  %45 = call ptr @malloc(i64 %44)
  %RAX20 = ptrtoint ptr %45 to i64
  store i64 %RAX20, ptr %RBP_N.136, align 1
  %46 = zext i32 4 to i64
  %47 = call ptr @malloc(i64 %46)
  %RAX21 = ptrtoint ptr %47 to i64
  store i64 %RAX21, ptr %RBP_N.144, align 1
  %48 = zext i32 4 to i64
  %49 = call ptr @malloc(i64 %48)
  %RAX22 = ptrtoint ptr %49 to i64
  store i64 %RAX22, ptr %RBP_N.152, align 1
  %50 = zext i32 4 to i64
  %51 = call ptr @malloc(i64 %50)
  %RAX23 = ptrtoint ptr %51 to i64
  %R9 = ptrtoint ptr %RBP_N.176 to i64
  %52 = ptrtoint ptr %RBP_N.176 to i64
  %R8 = add i64 %52, 4
  %RCX24 = ptrtoint ptr %RBP_N.168 to i64
  %53 = ptrtoint ptr %RBP_N.168 to i64
  %RDX = add i64 %53, 4
  %RSI = ptrtoint ptr %RBP_N.128 to i64
  store i64 %RAX23, ptr %RBP_N.160, align 1
  %memload25 = load i64, ptr %RBP_N.136, align 1
  %memload26 = load i32, ptr %16, align 1
  %54 = inttoptr i64 %memload25 to ptr
  store i32 %memload26, ptr %54, align 1
  %memload27 = load i64, ptr %RBP_N.144, align 1
  %55 = getelementptr i8, ptr %16, i64 4
  %memload28 = load i32, ptr %55, align 1
  %56 = inttoptr i64 %memload27 to ptr
  store i32 %memload28, ptr %56, align 1
  %memload29 = load i64, ptr %RBP_N.152, align 1
  %memload30 = load i32, ptr %RBP_N.24, align 1
  %57 = inttoptr i64 %memload29 to ptr
  store i32 %memload30, ptr %57, align 1
  %memload31 = load i64, ptr %RBP_N.160, align 1
  %memload32 = load i32, ptr %RBP_N.20, align 1
  %58 = inttoptr i64 %memload31 to ptr
  store i32 %memload32, ptr %58, align 1
  %memload33 = load i64, ptr %RBP_N.136, align 1
  call void @secret_comp(i64 %memload33, i64 %RSI, i64 %RDX, i64 %RCX24, i64 %R8, i64 %R9)
  %R934 = ptrtoint ptr %RBP_N.176 to i64
  %59 = ptrtoint ptr %RBP_N.176 to i64
  %R835 = add i64 %59, 4
  %RCX36 = ptrtoint ptr %RBP_N.168 to i64
  %60 = ptrtoint ptr %RBP_N.168 to i64
  %RDX37 = add i64 %60, 4
  %RSI38 = ptrtoint ptr %RBP_N.128 to i64
  %memload39 = load i64, ptr %RBP_N.144, align 1
  call void @secret_comp(i64 %memload39, i64 %RSI38, i64 %RDX37, i64 %RCX36, i64 %R835, i64 %R934)
  %RDX40 = ptrtoint ptr %RBP_N.184 to i64
  %61 = ptrtoint ptr %RBP_N.184 to i64
  %RSI41 = add i64 %61, 4
  %RDI42 = ptrtoint ptr %RBP_N.188 to i64
  %memload43 = load i32, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 96), align 1, !ROData_Content !3
  %62 = getelementptr i8, ptr %RBP_N.184, i64 4
  store i32 %memload43, ptr %62, align 1
  %memload44 = load i32, ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 100), align 1, !ROData_Content !4
  store i32 %memload44, ptr %RBP_N.184, align 1
  %EAX45 = call i32 @public_comp(i64 %RDI42, i64 %RSI41, i64 %RDX40, i32 4)
  %63 = ptrtoint ptr %RBP_N.168 to i64
  %RDX46 = add i64 %63, 4
  %RSI47 = ptrtoint ptr %RBP_N.188 to i64
  %RDI48 = ptrtoint ptr %RBP_N.192 to i64
  %EAX49 = call i32 @mix_comp(i64 %RDI48, i64 %RSI47, i64 %RDX46, i32 4)
  %EAX50 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 10))
  %memload51 = load i32, ptr %RBP_N.4, align 1
  store i32 %EAX50, ptr %RBP_N.196, align 1
  ret i32 %memload51
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.usub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 4202496}
!1 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 80)}
!2 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 88)}
!3 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 96)}
!4 = !{ptr getelementptr inbounds ([104 x i8], ptr @rodata_15, i32 0, i32 100)}
