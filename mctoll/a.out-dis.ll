; ModuleID = 'a.out'
source_filename = "a.out"

define dso_local i32 @main(i32 %arg1, i64 %arg2) {
entry:
  %stktop_8 = alloca i8, i32 40, align 1
  %tos = ptrtoint ptr %stktop_8 to i64
  %0 = add i64 %tos, 20
  %RBP_N.20 = inttoptr i64 %0 to ptr
  %1 = add i64 %tos, 36
  %RBP_N.4 = inttoptr i64 %1 to ptr
  %2 = add i64 %tos, 0
  %RSP_P.0 = inttoptr i64 %2 to ptr
  store i64 3735928559, ptr %RSP_P.0, align 8
  %RBP = ptrtoint ptr %RSP_P.0 to i64
  store i32 %arg1, ptr %RBP_N.20, align 1
  store i64 %arg2, ptr %stktop_8, align 1
  store i32 0, ptr %RBP_N.4, align 1
  %memload = load i32, ptr %RBP_N.4, align 1
  ret i32 %memload
}
