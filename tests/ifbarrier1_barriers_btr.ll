; ModuleID = '../../../src/pocl.loopbarriers/tests/ifbarrier1_barriers.ll'

declare void @barrier(i32)

define void @ifbarrier1() {
a:
  br i1 true, label %b, label %barrier.prebarrier

b:                                                ; preds = %a
  br label %c

barrier.prebarrier:                               ; preds = %a
  br label %barrier

barrier:                                          ; preds = %barrier.prebarrier
  call void @barrier(i32 0)
  br label %barrier.postbarrier.btr

barrier.postbarrier:                              ; No predecessors!
  br label %c

c:                                                ; preds = %barrier.postbarrier, %b
  ret void

barrier.postbarrier.btr:                          ; preds = %barrier
  br label %c.btr

c.btr:                                            ; preds = %barrier.postbarrier.btr
  ret void
}
