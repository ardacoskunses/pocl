; ModuleID = '../../../src/pocl.loopbarriers/tests/barrier1.ll'

declare void @barrier(i32)

define void @barrier1() {
a.prebarrier:
  br label %a

a:                                                ; preds = %a.prebarrier
  call void @barrier(i32 0)
  br label %a.postbarrier

a.postbarrier:                                    ; preds = %a
  ret void
}
