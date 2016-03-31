;TODO: write out explanation
(load "../utils.scm")
(load "../test-lib.scm")

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
; Runs indefinitely because our interpreter uses applicative order, so the 
; parameters are evaluated and substituted in before the function is actually run, meaning
; (p) is an infinite recursion.
