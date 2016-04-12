(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (my-cons x y)
  (lambda (f) (f x y)))

(define (my-car pair)
  (pair (lambda (x y) x)))

(define (my-cdr pair)
  (pair (lambda (x y) y)))

(define test (my-cons 1 2))
(assert-eq (my-car test) 1)
; substition model
; (my-car test)
; (test (lambda (x y) x))
; ((lambda (f) (f 1 2)) (lambda (x y) x))
; ((lambda (x y) x) 1 2)
; 1




