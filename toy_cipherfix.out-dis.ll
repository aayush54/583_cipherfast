; ModuleID = 'toy_cipherfix.out'
source_filename = "toy_cipherfix.out"

@rodata_15 = private unnamed_addr constant [112 x i8] c"\01\00\02\00\01\04\10@\0A\0B\0C\0D\11\223D%i\00%c\00%d \00EOL\0A\00\00abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\00\00\0C\B8dV\A7:U\D1\90\1B\BD\0BL\FF\13m", align 16, !ROData_SecInfo !0

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

bb.1:                                             ; preds = %entry, %bb.2
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

bb.1:                                             ; preds = %entry, %bb.2
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
  %memload = load i32, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 4), align 1, !ROData_Content !1
  store i32 %memload, ptr %RBP_N.32, align 1
  store i32 0, ptr %RBP_N.36, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %memload1 = load i32, ptr %RBP_N.36, align 1
  %7 = load i32, ptr %RBP_N.28, align 1
  %8 = sub i32 %memload1, %7
  %9 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload1, i32 %7)
  %CF = extractvalue { i32, i1 } %9, 1
  %ZF = icmp eq i32 %8, 0
  %highbit = and i32 -2147483648, %8
  %SF = icmp ne i32 %highbit, 0
  %10 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload1, i32 %7)
  %OF = extractvalue { i32, i1 } %10, 1
  %11 = and i32 %8, 255
  %12 = call i32 @llvm.ctpop.i32(i32 %11)
  %13 = and i32 %12, 1
  %PF = icmp eq i32 %13, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %memload2 = load i64, ptr %RBP_N.16, align 1
  %memload3 = load i64, ptr %RBP_N.36, align 1
  %14 = trunc i64 %memload3 to i32
  %RCX = sext i32 %14 to i64
  %memref-basereg = add i64 %memload2, %RCX
  %15 = inttoptr i64 %memref-basereg to ptr
  %memload4 = load i32, ptr %15, align 1
  %16 = trunc i32 %memload4 to i8
  %EDX = sext i8 %16 to i32
  %memload5 = load i64, ptr %RBP_N.24, align 1
  %memload6 = load i64, ptr %RBP_N.36, align 1
  %17 = trunc i64 %memload6 to i32
  %RCX7 = sext i32 %17 to i64
  %memref-basereg8 = add i64 %memload5, %RCX7
  %18 = inttoptr i64 %memref-basereg8 to ptr
  %memload9 = load i32, ptr %18, align 1
  %19 = trunc i32 %memload9 to i8
  %ESI = sext i8 %19 to i32
  %EDX10 = mul nsw i32 %EDX, %ESI
  %memload11 = load i64, ptr %RBP_N.8, align 1
  %memload12 = load i64, ptr %RBP_N.36, align 1
  %20 = trunc i64 %memload12 to i32
  %RCX13 = sext i32 %20 to i64
  %memref-basereg14 = add i64 %memload11, %RCX13
  %21 = trunc i32 %EDX10 to i8
  %22 = inttoptr i64 %memref-basereg14 to ptr
  store i8 %21, ptr %22, align 1
  %memload15 = load i32, ptr %RBP_N.36, align 1
  %EAX = add i32 %memload15, 1
  %23 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload15, i32 1)
  %CF16 = extractvalue { i32, i1 } %23, 1
  %24 = and i32 %EAX, 255
  %25 = call i32 @llvm.ctpop.i32(i32 %24)
  %26 = and i32 %25, 1
  %PF17 = icmp eq i32 %26, 0
  %ZF18 = icmp eq i32 %EAX, 0
  %highbit19 = and i32 -2147483648, %EAX
  %SF20 = icmp ne i32 %highbit19, 0
  %27 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload15, i32 1)
  %OF21 = extractvalue { i32, i1 } %27, 1
  store i32 %EAX, ptr %RBP_N.36, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  store i32 0, ptr %stktop_4, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.5
  %memload22 = load i32, ptr %stktop_4, align 1
  %28 = load i32, ptr %RBP_N.28, align 1
  %29 = sub i32 %memload22, %28
  %30 = call { i32, i1 } @llvm.usub.with.overflow.i32(i32 %memload22, i32 %28)
  %CF23 = extractvalue { i32, i1 } %30, 1
  %ZF24 = icmp eq i32 %29, 0
  %highbit25 = and i32 -2147483648, %29
  %SF26 = icmp ne i32 %highbit25, 0
  %31 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %memload22, i32 %28)
  %OF27 = extractvalue { i32, i1 } %31, 1
  %32 = and i32 %29, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %32)
  %34 = and i32 %33, 1
  %PF28 = icmp eq i32 %34, 0
  %CmpSFOF_JGE49 = icmp eq i1 %SF26, %OF27
  br i1 %CmpSFOF_JGE49, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload29 = load i64, ptr %stktop_4, align 1
  %35 = trunc i64 %memload29 to i32
  %RAX = sext i32 %35 to i64
  %36 = getelementptr i8, ptr %RBP_N.32, i64 %RAX
  %memload30 = load i32, ptr %36, align 1
  %37 = trunc i32 %memload30 to i8
  %ECX = sext i8 %37 to i32
  %memload31 = load i64, ptr %RBP_N.8, align 1
  %memload32 = load i64, ptr %stktop_4, align 1
  %38 = trunc i64 %memload32 to i32
  %RDX = sext i32 %38 to i64
  %memref-basereg33 = add i64 %memload31, %RDX
  %39 = inttoptr i64 %memref-basereg33 to ptr
  %memload34 = load i32, ptr %39, align 1
  %40 = trunc i32 %memload34 to i8
  %ESI35 = sext i8 %40 to i32
  %ESI39 = add nsw i32 %ESI35, %ECX
  %highbit36 = and i32 -2147483648, %ESI39
  %SF37 = icmp ne i32 %highbit36, 0
  %ZF38 = icmp eq i32 %ESI39, 0
  %memref-basereg40 = add i64 %memload31, %RDX
  %41 = trunc i32 %ESI39 to i8
  %42 = inttoptr i64 %memref-basereg40 to ptr
  store i8 %41, ptr %42, align 1
  %memload41 = load i32, ptr %stktop_4, align 1
  %EAX48 = add i32 %memload41, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload41, i32 1)
  %CF42 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EAX48, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF43 = icmp eq i32 %46, 0
  %ZF44 = icmp eq i32 %EAX48, 0
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload41, i32 1)
  %OF47 = extractvalue { i32, i1 } %47, 1
  store i32 %EAX48, ptr %stktop_4, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  ret i32 %memload22
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

bb.1:                                             ; preds = %entry, %bb.2
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
  %EAX = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 16), i32 %memload1)
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
  %EAX5 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 19), i32 %ESI, i64 %RDX, i64 %memload2)
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
  %stktop_8 = alloca i8, i32 232, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.216 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.212 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.208 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 28
  %RBP_N.204 = inttoptr i64 %3 to ptr
  %4 = add i64 %tos, 32
  %RBP_N.200 = inttoptr i64 %4 to ptr
  %5 = add i64 %tos, 36
  %RBP_N.196 = inttoptr i64 %5 to ptr
  %6 = add i64 %tos, 40
  %RBP_N.192 = inttoptr i64 %6 to ptr
  %7 = add i64 %tos, 44
  %RBP_N.188 = inttoptr i64 %7 to ptr
  %8 = add i64 %tos, 48
  %RBP_N.184 = inttoptr i64 %8 to ptr
  %9 = add i64 %tos, 56
  %RBP_N.176 = inttoptr i64 %9 to ptr
  %10 = add i64 %tos, 64
  %RBP_N.168 = inttoptr i64 %10 to ptr
  %11 = add i64 %tos, 72
  %RBP_N.160 = inttoptr i64 %11 to ptr
  %12 = add i64 %tos, 80
  %RBP_N.152 = inttoptr i64 %12 to ptr
  %13 = add i64 %tos, 88
  %RBP_N.144 = inttoptr i64 %13 to ptr
  %14 = add i64 %tos, 96
  %RBP_N.136 = inttoptr i64 %14 to ptr
  %15 = add i64 %tos, 104
  %RBP_N.128 = inttoptr i64 %15 to ptr
  %16 = add i64 %tos, 112
  %RBP_N.120 = inttoptr i64 %16 to ptr
  %17 = add i64 %tos, 132
  %RBP_N.100 = inttoptr i64 %17 to ptr
  %18 = add i64 %tos, 136
  %19 = inttoptr i64 %18 to ptr
  %20 = add i64 %tos, 200
  %21 = inttoptr i64 %20 to ptr
  %22 = add i64 %tos, 208
  %RBP_N.24 = inttoptr i64 %22 to ptr
  %23 = add i64 %tos, 212
  %RBP_N.20 = inttoptr i64 %23 to ptr
  %24 = add i64 %tos, 228
  %RBP_N.4 = inttoptr i64 %24 to ptr
  %25 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %25 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 0, ptr %RBP_N.4, align 1
  %26 = zext i32 16 to i64
  %27 = call ptr @memset(ptr %21, i32 0, i64 %26)
  %RAX1 = ptrtoint ptr %27 to i64
  %28 = zext i32 63 to i64
  %29 = call ptr @memcpy(ptr %19, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 32), i64 %28)
  %RAX3 = ptrtoint ptr %29 to i64
  store i32 0, ptr %RBP_N.100, align 1
  store i64 %RAX3, ptr %EAX-SKT-LOC, align 1
  br label %bb.1

bb.1:                                             ; preds = %entry, %bb.2
  %30 = load i32, ptr %RBP_N.100, align 1
  %31 = zext i32 %30 to i64
  %32 = zext i32 16 to i64
  %33 = sub i64 %31, %32
  %34 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %31, i64 %32)
  %CF = extractvalue { i64, i1 } %34, 1
  %ZF = icmp eq i64 %33, 0
  %highbit = and i64 -9223372036854775808, %33
  %SF = icmp ne i64 %highbit, 0
  %35 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 %32)
  %OF = extractvalue { i64, i1 } %35, 1
  %36 = and i64 %33, 255
  %37 = call i64 @llvm.ctpop.i64(i64 %36)
  %38 = and i64 %37, 1
  %PF = icmp eq i64 %38, 0
  %CmpSFOF_JGE = icmp eq i1 %SF, %OF
  br i1 %CmpSFOF_JGE, label %bb.3, label %bb.2

bb.2:                                             ; preds = %bb.1
  %39 = load i64, ptr %EAX-SKT-LOC, align 1
  %EAX = trunc i64 %39 to i32
  %memload = load i32, ptr %RBP_N.100, align 1
  %EAX4 = mul i32 3, %memload
  %RCX = sext i32 %EAX4 to i64
  %40 = getelementptr i8, ptr %19, i64 %RCX
  %memload5 = load i8, ptr %40, align 1
  %memload6 = load i64, ptr %RBP_N.100, align 1
  %41 = trunc i64 %memload6 to i32
  %RCX7 = sext i32 %41 to i64
  %42 = getelementptr i8, ptr %21, i64 %RCX7
  store i8 %memload5, ptr %42, align 1
  %memload9 = load i32, ptr %RBP_N.100, align 1
  %EAX16 = add i32 %memload9, 1
  %43 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload9, i32 1)
  %CF10 = extractvalue { i32, i1 } %43, 1
  %44 = and i32 %EAX16, 255
  %45 = call i32 @llvm.ctpop.i32(i32 %44)
  %46 = and i32 %45, 1
  %PF11 = icmp eq i32 %46, 0
  %ZF12 = icmp eq i32 %EAX16, 0
  %highbit13 = and i32 -2147483648, %EAX16
  %SF14 = icmp ne i32 %highbit13, 0
  %47 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload9, i32 1)
  %OF15 = extractvalue { i32, i1 } %47, 1
  store i32 %EAX16, ptr %RBP_N.100, align 1
  %48 = zext i32 %EAX16 to i64
  store i64 %48, ptr %EAX-SKT-LOC, align 1
  br label %bb.1

bb.3:                                             ; preds = %bb.1
  %RDI = ptrtoint ptr %21 to i64
  %memload17 = load i64, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 96), align 1, !ROData_Content !2
  store i64 %memload17, ptr %RBP_N.128, align 1
  %memload18 = load i64, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 104), align 1, !ROData_Content !3
  store i64 %memload18, ptr %RBP_N.120, align 1
  call void @classify(i64 %RDI, i32 16)
  %RDI19 = ptrtoint ptr %RBP_N.128 to i64
  call void @classify(i64 %RDI19, i32 16)
  %49 = zext i32 4 to i64
  %50 = call ptr @malloc(i64 %49)
  %RAX20 = ptrtoint ptr %50 to i64
  store i64 %RAX20, ptr %RBP_N.136, align 1
  %51 = zext i32 4 to i64
  %52 = call ptr @malloc(i64 %51)
  %RAX21 = ptrtoint ptr %52 to i64
  store i64 %RAX21, ptr %RBP_N.144, align 1
  %53 = zext i32 4 to i64
  %54 = call ptr @malloc(i64 %53)
  %RAX22 = ptrtoint ptr %54 to i64
  store i64 %RAX22, ptr %RBP_N.152, align 1
  %55 = zext i32 4 to i64
  %56 = call ptr @malloc(i64 %55)
  %RAX23 = ptrtoint ptr %56 to i64
  %R9 = ptrtoint ptr %RBP_N.176 to i64
  %57 = ptrtoint ptr %RBP_N.176 to i64
  %R8 = add i64 %57, 4
  %RCX24 = ptrtoint ptr %RBP_N.168 to i64
  %58 = ptrtoint ptr %RBP_N.168 to i64
  %RDX = add i64 %58, 4
  %RSI = ptrtoint ptr %RBP_N.128 to i64
  store i64 %RAX23, ptr %RBP_N.160, align 1
  %memload25 = load i64, ptr %RBP_N.136, align 1
  %memload26 = load i32, ptr %21, align 1
  %59 = inttoptr i64 %memload25 to ptr
  store i32 %memload26, ptr %59, align 1
  %memload27 = load i64, ptr %RBP_N.144, align 1
  %60 = getelementptr i8, ptr %21, i64 4
  %memload28 = load i32, ptr %60, align 1
  %61 = inttoptr i64 %memload27 to ptr
  store i32 %memload28, ptr %61, align 1
  %memload29 = load i64, ptr %RBP_N.152, align 1
  %memload30 = load i32, ptr %RBP_N.24, align 1
  %62 = inttoptr i64 %memload29 to ptr
  store i32 %memload30, ptr %62, align 1
  %memload31 = load i64, ptr %RBP_N.160, align 1
  %memload32 = load i32, ptr %RBP_N.20, align 1
  %63 = inttoptr i64 %memload31 to ptr
  store i32 %memload32, ptr %63, align 1
  %memload33 = load i64, ptr %RBP_N.136, align 1
  call void @secret_comp(i64 %memload33, i64 %RSI, i64 %RDX, i64 %RCX24, i64 %R8, i64 %R9)
  %R934 = ptrtoint ptr %RBP_N.176 to i64
  %64 = ptrtoint ptr %RBP_N.176 to i64
  %R835 = add i64 %64, 4
  %RCX36 = ptrtoint ptr %RBP_N.168 to i64
  %65 = ptrtoint ptr %RBP_N.168 to i64
  %RDX37 = add i64 %65, 4
  %RSI38 = ptrtoint ptr %RBP_N.128 to i64
  %memload39 = load i64, ptr %RBP_N.144, align 1
  call void @secret_comp(i64 %memload39, i64 %RSI38, i64 %RDX37, i64 %RCX36, i64 %R835, i64 %R934)
  %RDX40 = ptrtoint ptr %RBP_N.184 to i64
  %66 = ptrtoint ptr %RBP_N.184 to i64
  %RSI41 = add i64 %66, 4
  %RDI42 = ptrtoint ptr %RBP_N.188 to i64
  %memload43 = load i32, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 8), align 1, !ROData_Content !4
  %67 = getelementptr i8, ptr %RBP_N.184, i64 4
  store i32 %memload43, ptr %67, align 1
  %memload44 = load i32, ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 12), align 1, !ROData_Content !5
  store i32 %memload44, ptr %RBP_N.184, align 1
  %EAX45 = call i32 @public_comp(i64 %RDI42, i64 %RSI41, i64 %RDX40, i32 4)
  %68 = ptrtoint ptr %RBP_N.168 to i64
  %RDX46 = add i64 %68, 4
  %RSI47 = ptrtoint ptr %RBP_N.188 to i64
  %RDI48 = ptrtoint ptr %RBP_N.192 to i64
  %EAX49 = call i32 @mix_comp(i64 %RDI48, i64 %RSI47, i64 %RDX46, i32 4)
  store i32 0, ptr %RBP_N.196, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.5
  %69 = load i32, ptr %RBP_N.196, align 1
  %70 = zext i32 %69 to i64
  %71 = zext i32 4 to i64
  %72 = sub i64 %70, %71
  %73 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %70, i64 %71)
  %CF50 = extractvalue { i64, i1 } %73, 1
  %ZF51 = icmp eq i64 %72, 0
  %highbit52 = and i64 -9223372036854775808, %72
  %SF53 = icmp ne i64 %highbit52, 0
  %74 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %70, i64 %71)
  %OF54 = extractvalue { i64, i1 } %74, 1
  %75 = and i64 %72, 255
  %76 = call i64 @llvm.ctpop.i64(i64 %75)
  %77 = and i64 %76, 1
  %PF55 = icmp eq i64 %77, 0
  %CmpSFOF_JGE175 = icmp eq i1 %SF53, %OF54
  br i1 %CmpSFOF_JGE175, label %bb.6, label %bb.5

bb.5:                                             ; preds = %bb.4
  %memload56 = load i64, ptr %RBP_N.196, align 1
  %78 = trunc i64 %memload56 to i32
  %RAX57 = sext i32 %78 to i64
  %79 = ptrtoint ptr %RBP_N.168 to i64
  %80 = add i64 %79, 4
  %idx-a58 = add i64 %80, %RAX57
  %81 = inttoptr i64 %idx-a58 to ptr
  %memload59 = load i32, ptr %81, align 1
  %82 = trunc i32 %memload59 to i8
  %ESI = sext i8 %82 to i32
  %EAX60 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI, i64 %RDX46, i32 4)
  %memload61 = load i32, ptr %RBP_N.196, align 1
  %EAX68 = add i32 %memload61, 1
  %83 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload61, i32 1)
  %CF62 = extractvalue { i32, i1 } %83, 1
  %84 = and i32 %EAX68, 255
  %85 = call i32 @llvm.ctpop.i32(i32 %84)
  %86 = and i32 %85, 1
  %PF63 = icmp eq i32 %86, 0
  %ZF64 = icmp eq i32 %EAX68, 0
  %highbit65 = and i32 -2147483648, %EAX68
  %SF66 = icmp ne i32 %highbit65, 0
  %87 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload61, i32 1)
  %OF67 = extractvalue { i32, i1 } %87, 1
  store i32 %EAX68, ptr %RBP_N.196, align 1
  br label %bb.4

bb.6:                                             ; preds = %bb.4
  %EAX69 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  store i32 0, ptr %RBP_N.200, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.8
  %88 = load i32, ptr %RBP_N.200, align 1
  %89 = zext i32 %88 to i64
  %90 = zext i32 4 to i64
  %91 = sub i64 %89, %90
  %92 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %89, i64 %90)
  %CF70 = extractvalue { i64, i1 } %92, 1
  %ZF71 = icmp eq i64 %91, 0
  %highbit72 = and i64 -9223372036854775808, %91
  %SF73 = icmp ne i64 %highbit72, 0
  %93 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %89, i64 %90)
  %OF74 = extractvalue { i64, i1 } %93, 1
  %94 = and i64 %91, 255
  %95 = call i64 @llvm.ctpop.i64(i64 %94)
  %96 = and i64 %95, 1
  %PF75 = icmp eq i64 %96, 0
  %CmpSFOF_JGE176 = icmp eq i1 %SF73, %OF74
  br i1 %CmpSFOF_JGE176, label %bb.9, label %bb.8

bb.8:                                             ; preds = %bb.7
  %memload76 = load i64, ptr %RBP_N.200, align 1
  %97 = trunc i64 %memload76 to i32
  %RAX77 = sext i32 %97 to i64
  %98 = getelementptr i8, ptr %RBP_N.168, i64 %RAX77
  %memload79 = load i32, ptr %98, align 1
  %99 = trunc i32 %memload79 to i8
  %ESI80 = sext i8 %99 to i32
  %EAX81 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI80, i64 %RDX46, i32 4)
  %memload82 = load i32, ptr %RBP_N.200, align 1
  %EAX89 = add i32 %memload82, 1
  %100 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload82, i32 1)
  %CF83 = extractvalue { i32, i1 } %100, 1
  %101 = and i32 %EAX89, 255
  %102 = call i32 @llvm.ctpop.i32(i32 %101)
  %103 = and i32 %102, 1
  %PF84 = icmp eq i32 %103, 0
  %ZF85 = icmp eq i32 %EAX89, 0
  %highbit86 = and i32 -2147483648, %EAX89
  %SF87 = icmp ne i32 %highbit86, 0
  %104 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload82, i32 1)
  %OF88 = extractvalue { i32, i1 } %104, 1
  store i32 %EAX89, ptr %RBP_N.200, align 1
  br label %bb.7

bb.9:                                             ; preds = %bb.7
  %EAX90 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  store i32 0, ptr %RBP_N.204, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.11
  %105 = load i32, ptr %RBP_N.204, align 1
  %106 = zext i32 %105 to i64
  %107 = zext i32 4 to i64
  %108 = sub i64 %106, %107
  %109 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %106, i64 %107)
  %CF91 = extractvalue { i64, i1 } %109, 1
  %ZF92 = icmp eq i64 %108, 0
  %highbit93 = and i64 -9223372036854775808, %108
  %SF94 = icmp ne i64 %highbit93, 0
  %110 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %106, i64 %107)
  %OF95 = extractvalue { i64, i1 } %110, 1
  %111 = and i64 %108, 255
  %112 = call i64 @llvm.ctpop.i64(i64 %111)
  %113 = and i64 %112, 1
  %PF96 = icmp eq i64 %113, 0
  %CmpSFOF_JGE177 = icmp eq i1 %SF94, %OF95
  br i1 %CmpSFOF_JGE177, label %bb.12, label %bb.11

bb.11:                                            ; preds = %bb.10
  %memload97 = load i64, ptr %RBP_N.204, align 1
  %114 = trunc i64 %memload97 to i32
  %RAX98 = sext i32 %114 to i64
  %115 = ptrtoint ptr %RBP_N.176 to i64
  %116 = add i64 %115, 4
  %idx-a99 = add i64 %116, %RAX98
  %117 = inttoptr i64 %idx-a99 to ptr
  %memload100 = load i32, ptr %117, align 1
  %118 = trunc i32 %memload100 to i8
  %ESI101 = sext i8 %118 to i32
  %EAX102 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI101, i64 %RDX46, i32 4)
  %memload103 = load i32, ptr %RBP_N.204, align 1
  %EAX110 = add i32 %memload103, 1
  %119 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload103, i32 1)
  %CF104 = extractvalue { i32, i1 } %119, 1
  %120 = and i32 %EAX110, 255
  %121 = call i32 @llvm.ctpop.i32(i32 %120)
  %122 = and i32 %121, 1
  %PF105 = icmp eq i32 %122, 0
  %ZF106 = icmp eq i32 %EAX110, 0
  %highbit107 = and i32 -2147483648, %EAX110
  %SF108 = icmp ne i32 %highbit107, 0
  %123 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload103, i32 1)
  %OF109 = extractvalue { i32, i1 } %123, 1
  store i32 %EAX110, ptr %RBP_N.204, align 1
  br label %bb.10

bb.12:                                            ; preds = %bb.10
  %EAX111 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  store i32 0, ptr %RBP_N.208, align 1
  br label %bb.13

bb.13:                                            ; preds = %bb.12, %bb.14
  %124 = load i32, ptr %RBP_N.208, align 1
  %125 = zext i32 %124 to i64
  %126 = zext i32 4 to i64
  %127 = sub i64 %125, %126
  %128 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %125, i64 %126)
  %CF112 = extractvalue { i64, i1 } %128, 1
  %ZF113 = icmp eq i64 %127, 0
  %highbit114 = and i64 -9223372036854775808, %127
  %SF115 = icmp ne i64 %highbit114, 0
  %129 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %125, i64 %126)
  %OF116 = extractvalue { i64, i1 } %129, 1
  %130 = and i64 %127, 255
  %131 = call i64 @llvm.ctpop.i64(i64 %130)
  %132 = and i64 %131, 1
  %PF117 = icmp eq i64 %132, 0
  %CmpSFOF_JGE178 = icmp eq i1 %SF115, %OF116
  br i1 %CmpSFOF_JGE178, label %bb.15, label %bb.14

bb.14:                                            ; preds = %bb.13
  %memload118 = load i64, ptr %RBP_N.208, align 1
  %133 = trunc i64 %memload118 to i32
  %RAX119 = sext i32 %133 to i64
  %134 = getelementptr i8, ptr %RBP_N.176, i64 %RAX119
  %memload121 = load i32, ptr %134, align 1
  %135 = trunc i32 %memload121 to i8
  %ESI122 = sext i8 %135 to i32
  %EAX123 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI122, i64 %RDX46, i32 4)
  %memload124 = load i32, ptr %RBP_N.208, align 1
  %EAX131 = add i32 %memload124, 1
  %136 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload124, i32 1)
  %CF125 = extractvalue { i32, i1 } %136, 1
  %137 = and i32 %EAX131, 255
  %138 = call i32 @llvm.ctpop.i32(i32 %137)
  %139 = and i32 %138, 1
  %PF126 = icmp eq i32 %139, 0
  %ZF127 = icmp eq i32 %EAX131, 0
  %highbit128 = and i32 -2147483648, %EAX131
  %SF129 = icmp ne i32 %highbit128, 0
  %140 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload124, i32 1)
  %OF130 = extractvalue { i32, i1 } %140, 1
  store i32 %EAX131, ptr %RBP_N.208, align 1
  br label %bb.13

bb.15:                                            ; preds = %bb.13
  %EAX132 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  store i32 0, ptr %RBP_N.212, align 1
  br label %bb.16

bb.16:                                            ; preds = %bb.15, %bb.17
  %141 = load i32, ptr %RBP_N.212, align 1
  %142 = zext i32 %141 to i64
  %143 = zext i32 4 to i64
  %144 = sub i64 %142, %143
  %145 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %142, i64 %143)
  %CF133 = extractvalue { i64, i1 } %145, 1
  %ZF134 = icmp eq i64 %144, 0
  %highbit135 = and i64 -9223372036854775808, %144
  %SF136 = icmp ne i64 %highbit135, 0
  %146 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %142, i64 %143)
  %OF137 = extractvalue { i64, i1 } %146, 1
  %147 = and i64 %144, 255
  %148 = call i64 @llvm.ctpop.i64(i64 %147)
  %149 = and i64 %148, 1
  %PF138 = icmp eq i64 %149, 0
  %CmpSFOF_JGE179 = icmp eq i1 %SF136, %OF137
  br i1 %CmpSFOF_JGE179, label %bb.18, label %bb.17

bb.17:                                            ; preds = %bb.16
  %memload139 = load i64, ptr %RBP_N.212, align 1
  %150 = trunc i64 %memload139 to i32
  %RAX140 = sext i32 %150 to i64
  %151 = getelementptr i8, ptr %RBP_N.188, i64 %RAX140
  %memload142 = load i32, ptr %151, align 1
  %152 = trunc i32 %memload142 to i8
  %ESI143 = sext i8 %152 to i32
  %EAX144 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI143, i64 %RDX46, i32 4)
  %memload145 = load i32, ptr %RBP_N.212, align 1
  %EAX152 = add i32 %memload145, 1
  %153 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload145, i32 1)
  %CF146 = extractvalue { i32, i1 } %153, 1
  %154 = and i32 %EAX152, 255
  %155 = call i32 @llvm.ctpop.i32(i32 %154)
  %156 = and i32 %155, 1
  %PF147 = icmp eq i32 %156, 0
  %ZF148 = icmp eq i32 %EAX152, 0
  %highbit149 = and i32 -2147483648, %EAX152
  %SF150 = icmp ne i32 %highbit149, 0
  %157 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload145, i32 1)
  %OF151 = extractvalue { i32, i1 } %157, 1
  store i32 %EAX152, ptr %RBP_N.212, align 1
  br label %bb.16

bb.18:                                            ; preds = %bb.16
  %EAX153 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  store i32 0, ptr %RBP_N.216, align 1
  br label %bb.19

bb.19:                                            ; preds = %bb.18, %bb.20
  %158 = load i32, ptr %RBP_N.216, align 1
  %159 = zext i32 %158 to i64
  %160 = zext i32 4 to i64
  %161 = sub i64 %159, %160
  %162 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %159, i64 %160)
  %CF154 = extractvalue { i64, i1 } %162, 1
  %ZF155 = icmp eq i64 %161, 0
  %highbit156 = and i64 -9223372036854775808, %161
  %SF157 = icmp ne i64 %highbit156, 0
  %163 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %159, i64 %160)
  %OF158 = extractvalue { i64, i1 } %163, 1
  %164 = and i64 %161, 255
  %165 = call i64 @llvm.ctpop.i64(i64 %164)
  %166 = and i64 %165, 1
  %PF159 = icmp eq i64 %166, 0
  %CmpSFOF_JGE180 = icmp eq i1 %SF157, %OF158
  br i1 %CmpSFOF_JGE180, label %bb.21, label %bb.20

bb.20:                                            ; preds = %bb.19
  %memload160 = load i64, ptr %RBP_N.216, align 1
  %167 = trunc i64 %memload160 to i32
  %RAX161 = sext i32 %167 to i64
  %168 = getelementptr i8, ptr %RBP_N.192, i64 %RAX161
  %memload163 = load i32, ptr %168, align 1
  %169 = trunc i32 %memload163 to i8
  %ESI164 = sext i8 %169 to i32
  %EAX165 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 22), i32 %ESI164, i64 %RDX46, i32 4)
  %memload166 = load i32, ptr %RBP_N.216, align 1
  %EAX173 = add i32 %memload166, 1
  %170 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload166, i32 1)
  %CF167 = extractvalue { i32, i1 } %170, 1
  %171 = and i32 %EAX173, 255
  %172 = call i32 @llvm.ctpop.i32(i32 %171)
  %173 = and i32 %172, 1
  %PF168 = icmp eq i32 %173, 0
  %ZF169 = icmp eq i32 %EAX173, 0
  %highbit170 = and i32 -2147483648, %EAX173
  %SF171 = icmp ne i32 %highbit170, 0
  %174 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload166, i32 1)
  %OF172 = extractvalue { i32, i1 } %174, 1
  store i32 %EAX173, ptr %RBP_N.216, align 1
  br label %bb.19

bb.21:                                            ; preds = %bb.19
  %EAX174 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 26))
  %175 = ptrtoint ptr %stktop_8 to i64
  %176 = add i64 %175, 4
  %177 = inttoptr i64 %176 to ptr
  store i32 %EAX174, ptr %177, align 1
  ret i32 0
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
!1 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 4)}
!2 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 96)}
!3 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 104)}
!4 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 8)}
!5 = !{ptr getelementptr inbounds ([112 x i8], ptr @rodata_15, i32 0, i32 12)}
