; ModuleID = 'toy.o'
source_filename = "toy.o"

@static_array = common dso_local global [4000000 x i8] zeroinitializer, align 32
@rodata_18 = private unnamed_addr constant [80 x i8] c"\01\00\02\00\00\00\00\00Failed to allocate memory for dynamic array.\00Static variable value: %d\0A\00", align 8, !ROData_SecInfo !0
@static_variable = common dso_local global i32 0, align 4

declare dso_local ptr @malloc(i64)

declare dso_local i32 @puts(ptr)

declare dso_local void @srand(i32)

declare dso_local i32 @printf(ptr, ...)

declare dso_local void @free(ptr)

declare dso_local i32 @rand()

define dso_local i32 @main() {
entry:
  %EAX-SKT-LOC = alloca i32, align 4
  %stktop_8 = alloca i8, i32 48, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 16
  %RBP_N.32 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 20
  %RBP_N.28 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 24
  %RBP_N.24 = inttoptr i64 %2 to ptr
  %3 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %3 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i64 3735928559, ptr %RSP_P.0, align 8
  %4 = bitcast ptr @static_array to ptr
  %EDI = getelementptr inbounds [1000000 x i32], ptr %4, i32 0, i32 995888
  %5 = ptrtoint ptr %EDI to i64
  %6 = call ptr @malloc(i64 %5)
  %RAX = ptrtoint ptr %6 to i64
  store i64 %RAX, ptr %RBP_N.24, align 1
  %7 = load i64, ptr %RBP_N.24, align 1
  %8 = sub i64 %7, 0
  %9 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %7, i64 0)
  %CF = extractvalue { i64, i1 } %9, 1
  %ZF = icmp eq i64 %8, 0
  %highbit = and i64 -9223372036854775808, %8
  %SF = icmp ne i64 %highbit, 0
  %10 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %7, i64 0)
  %OF = extractvalue { i64, i1 } %10, 1
  %11 = and i64 %8, 255
  %12 = call i64 @llvm.ctpop.i64(i64 %11)
  %13 = and i64 %12, 1
  %PF = icmp eq i64 %13, 0
  %CmpZF_JNE = icmp eq i1 %ZF, false
  br i1 %CmpZF_JNE, label %bb.2, label %bb.1

bb.1:                                             ; preds = %entry
  %EAX = call i32 @puts(ptr getelementptr inbounds ([80 x i8], ptr @rodata_18, i32 0, i32 8))
  store i32 1, ptr %EAX-SKT-LOC, align 1
  br label %bb.12

bb.2:                                             ; preds = %entry
  call void @srand(i32 10)
  %14 = ptrtoint ptr %stktop_8 to i64
  %15 = add i64 %14, 4
  %16 = inttoptr i64 %15 to ptr
  store i32 0, ptr %16, align 1
  br label %bb.4

bb.4:                                             ; preds = %bb.3, %bb.2
  %17 = ptrtoint ptr %stktop_8 to i64
  %18 = add i64 %17, 4
  %19 = inttoptr i64 %18 to ptr
  %20 = load i32, ptr %19, align 1
  %21 = zext i32 %20 to i64
  %22 = zext i32 999999 to i64
  %23 = sub i64 %21, %22
  %24 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %21, i64 %22)
  %CF1 = extractvalue { i64, i1 } %24, 1
  %ZF2 = icmp eq i64 %23, 0
  %highbit3 = and i64 -9223372036854775808, %23
  %SF4 = icmp ne i64 %highbit3, 0
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %21, i64 %22)
  %OF5 = extractvalue { i64, i1 } %25, 1
  %26 = and i64 %23, 255
  %27 = call i64 @llvm.ctpop.i64(i64 %26)
  %28 = and i64 %27, 1
  %PF6 = icmp eq i64 %28, 0
  %CmpZF_JLE = icmp eq i1 %ZF2, true
  %CmpOF_JLE = icmp ne i1 %SF4, %OF5
  %ZFOrSF_JLE = or i1 %CmpZF_JLE, %CmpOF_JLE
  br i1 %ZFOrSF_JLE, label %bb.3, label %bb.5

bb.5:                                             ; preds = %bb.4
  store i32 0, ptr %RBP_N.32, align 1
  br label %bb.7

bb.7:                                             ; preds = %bb.6, %bb.5
  %29 = load i32, ptr %RBP_N.32, align 1
  %30 = zext i32 %29 to i64
  %31 = zext i32 999999 to i64
  %32 = sub i64 %30, %31
  %33 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %30, i64 %31)
  %CF7 = extractvalue { i64, i1 } %33, 1
  %ZF8 = icmp eq i64 %32, 0
  %highbit9 = and i64 -9223372036854775808, %32
  %SF10 = icmp ne i64 %highbit9, 0
  %34 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %30, i64 %31)
  %OF11 = extractvalue { i64, i1 } %34, 1
  %35 = and i64 %32, 255
  %36 = call i64 @llvm.ctpop.i64(i64 %35)
  %37 = and i64 %36, 1
  %PF12 = icmp eq i64 %37, 0
  %CmpZF_JLE83 = icmp eq i1 %ZF8, true
  %CmpOF_JLE84 = icmp ne i1 %SF10, %OF11
  %ZFOrSF_JLE85 = or i1 %CmpZF_JLE83, %CmpOF_JLE84
  br i1 %ZFOrSF_JLE85, label %bb.6, label %bb.8

bb.8:                                             ; preds = %bb.7
  store i32 0, ptr %RBP_N.28, align 1
  br label %bb.10

bb.10:                                            ; preds = %bb.9, %bb.8
  %38 = load i32, ptr %RBP_N.28, align 1
  %39 = zext i32 %38 to i64
  %40 = zext i32 999999 to i64
  %41 = sub i64 %39, %40
  %42 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 %39, i64 %40)
  %CF13 = extractvalue { i64, i1 } %42, 1
  %ZF14 = icmp eq i64 %41, 0
  %highbit15 = and i64 -9223372036854775808, %41
  %SF16 = icmp ne i64 %highbit15, 0
  %43 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %39, i64 %40)
  %OF17 = extractvalue { i64, i1 } %43, 1
  %44 = and i64 %41, 255
  %45 = call i64 @llvm.ctpop.i64(i64 %44)
  %46 = and i64 %45, 1
  %PF18 = icmp eq i64 %46, 0
  %CmpZF_JLE86 = icmp eq i1 %ZF14, true
  %CmpOF_JLE87 = icmp ne i1 %SF16, %OF17
  %ZFOrSF_JLE88 = or i1 %CmpZF_JLE86, %CmpOF_JLE87
  br i1 %ZFOrSF_JLE88, label %bb.9, label %bb.11

bb.11:                                            ; preds = %bb.10
  %ESI = ptrtoint ptr @static_variable to i32
  %EAX20 = call i32 (ptr, ...) @printf(ptr getelementptr inbounds ([80 x i8], ptr @rodata_18, i32 0, i32 53), i32 %ESI)
  %memload = load i64, ptr %RBP_N.24, align 1
  %47 = inttoptr i64 %memload to ptr
  call void @free(ptr %47)
  store i32 0, ptr %EAX-SKT-LOC, align 1
  br label %bb.12

bb.12:                                            ; preds = %bb.11, %bb.1
  %EAX21 = load i32, ptr %EAX-SKT-LOC, align 1
  ret i32 %EAX21

bb.9:                                             ; preds = %bb.10
  %memload22 = load i32, ptr %RBP_N.28, align 1
  %RAX23 = sext i32 %memload22 to i64
  %memref-idxreg = mul i64 4, %RAX23
  %memload24 = load i64, ptr %RBP_N.24, align 1
  %RAX28 = add nsw i64 %memload24, %memref-idxreg
  %highbit25 = and i64 -9223372036854775808, %RAX28
  %SF26 = icmp ne i64 %highbit25, 0
  %ZF27 = icmp eq i64 %RAX28, 0
  %48 = inttoptr i64 %RAX28 to ptr
  %memload29 = load i32, ptr %48, align 1
  %EDX = add i32 %memload29, 1
  %49 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %memload29, i32 1)
  %CF30 = extractvalue { i32, i1 } %49, 1
  %50 = and i32 %EDX, 255
  %51 = call i32 @llvm.ctpop.i32(i32 %50)
  %52 = and i32 %51, 1
  %PF31 = icmp eq i32 %52, 0
  %ZF32 = icmp eq i32 %EDX, 0
  %highbit33 = and i32 -2147483648, %EDX
  %SF34 = icmp ne i32 %highbit33, 0
  %53 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %memload29, i32 1)
  %OF35 = extractvalue { i32, i1 } %53, 1
  %54 = inttoptr i64 %RAX28 to ptr
  store i32 %EDX, ptr %54, align 1
  %memload36 = load i32, ptr %RBP_N.28, align 1
  %RAX37 = sext i32 %memload36 to i64
  %memref-idxreg38 = mul i64 4, %RAX37
  %memload39 = load i64, ptr %RBP_N.24, align 1
  %RAX43 = add nsw i64 %memload39, %memref-idxreg38
  %highbit40 = and i64 -9223372036854775808, %RAX43
  %SF41 = icmp ne i64 %highbit40, 0
  %ZF42 = icmp eq i64 %RAX43, 0
  %55 = inttoptr i64 %RAX43 to ptr
  %memload44 = load i32, ptr %55, align 1
  %56 = ptrtoint ptr @static_variable to i32
  %EAX48 = add nsw i32 %56, %memload44
  %highbit45 = and i32 -2147483648, %EAX48
  %SF46 = icmp ne i32 %highbit45, 0
  %ZF47 = icmp eq i32 %EAX48, 0
  store i32 %EAX48, ptr @static_variable, align 1
  %57 = zext i8 1 to i32
  %58 = load i32, ptr %RBP_N.28, align 1
  %59 = add i32 %58, %57
  %60 = and i32 %59, 255
  %61 = call i32 @llvm.ctpop.i32(i32 %60)
  %62 = and i32 %61, 1
  %PF49 = icmp eq i32 %62, 0
  store i32 %59, ptr %RBP_N.28, align 1
  br label %bb.10

bb.6:                                             ; preds = %bb.7
  %memload50 = load i32, ptr %RBP_N.32, align 1
  %RAX51 = sext i32 %memload50 to i64
  %memref-idxreg52 = mul i64 4, %RAX51
  %63 = bitcast ptr @static_array to ptr
  %64 = getelementptr inbounds [500000 x i64], ptr %63, i32 0, i32 0
  %RAX53 = ptrtoint ptr %64 to i64
  %memref-basereg = add i64 %memref-idxreg52, %RAX53
  %65 = inttoptr i64 %memref-basereg to ptr
  %memload54 = load i32, ptr %65, align 1
  %memref-disp = add i32 %memload54, 1
  %memload55 = load i32, ptr %RBP_N.32, align 1
  %RAX56 = sext i32 %memload55 to i64
  %memref-idxreg57 = mul i64 4, %RAX56
  %66 = bitcast ptr @static_array to ptr
  %67 = getelementptr inbounds [500000 x i64], ptr %66, i32 0, i32 0
  %RAX58 = ptrtoint ptr %67 to i64
  %memref-basereg59 = add i64 %memref-idxreg57, %RAX58
  %68 = inttoptr i64 %memref-basereg59 to ptr
  store i32 %memref-disp, ptr %68, align 1
  %memload60 = load i32, ptr %RBP_N.32, align 1
  %RAX61 = sext i32 %memload60 to i64
  %memref-idxreg62 = mul i64 4, %RAX61
  %69 = bitcast ptr @static_array to ptr
  %70 = getelementptr inbounds [500000 x i64], ptr %69, i32 0, i32 0
  %RAX63 = ptrtoint ptr %70 to i64
  %memref-basereg64 = add i64 %memref-idxreg62, %RAX63
  %71 = inttoptr i64 %memref-basereg64 to ptr
  %memload65 = load i32, ptr %71, align 1
  %72 = ptrtoint ptr @static_variable to i32
  %EAX69 = add nsw i32 %72, %memload65
  %highbit66 = and i32 -2147483648, %EAX69
  %SF67 = icmp ne i32 %highbit66, 0
  %ZF68 = icmp eq i32 %EAX69, 0
  store i32 %EAX69, ptr @static_variable, align 1
  %73 = zext i8 1 to i32
  %74 = load i32, ptr %RBP_N.32, align 1
  %75 = add i32 %74, %73
  %76 = and i32 %75, 255
  %77 = call i32 @llvm.ctpop.i32(i32 %76)
  %78 = and i32 %77, 1
  %PF70 = icmp eq i32 %78, 0
  store i32 %75, ptr %RBP_N.32, align 1
  br label %bb.7

bb.3:                                             ; preds = %bb.4
  %EAX71 = call i32 @rand()
  %79 = ptrtoint ptr %stktop_8 to i64
  %80 = add i64 %79, 4
  %81 = inttoptr i64 %80 to ptr
  %memload72 = load i32, ptr %81, align 1
  %RDX = sext i32 %memload72 to i64
  %memref-idxreg73 = mul i64 4, %RDX
  %82 = bitcast ptr @static_array to ptr
  %83 = getelementptr inbounds [500000 x i64], ptr %82, i32 0, i32 0
  %RDX74 = ptrtoint ptr %83 to i64
  %memref-basereg75 = add i64 %memref-idxreg73, %RDX74
  %84 = inttoptr i64 %memref-basereg75 to ptr
  store i32 %EAX71, ptr %84, align 1
  %85 = ptrtoint ptr %stktop_8 to i64
  %86 = add i64 %85, 4
  %87 = inttoptr i64 %86 to ptr
  %memload76 = load i32, ptr %87, align 1
  %RAX77 = sext i32 %memload76 to i64
  %memref-idxreg78 = mul i64 4, %RAX77
  %memload79 = load i64, ptr %RBP_N.24, align 1
  %memref-basereg80 = add i64 %memref-idxreg78, %memload79
  %EAX81 = call i32 @rand()
  %88 = inttoptr i64 %memref-basereg80 to ptr
  store i32 %EAX81, ptr %88, align 1
  %89 = ptrtoint ptr %stktop_8 to i64
  %90 = add i64 %89, 4
  %91 = inttoptr i64 %90 to ptr
  %92 = zext i8 1 to i32
  %93 = load i32, ptr %91, align 1
  %94 = add i32 %93, %92
  %95 = and i32 %94, 255
  %96 = call i32 @llvm.ctpop.i32(i32 %95)
  %97 = and i32 %96, 1
  %PF82 = icmp eq i32 %97, 0
  store i32 %94, ptr %91, align 1
  br label %bb.4
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #0

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!0 = !{i64 8192}
