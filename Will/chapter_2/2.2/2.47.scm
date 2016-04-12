(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define origin-frame car)
(define edge1-frame cadr)
(define edge2-frame caddr)

(define test-frame (make-frame (cons 0 0) (cons 1 0) (cons 0 1)))

(assert-eq (origin-frame test-frame) (cons 0 0))
(assert-eq (edge1-frame test-frame) (cons 1 0))
(assert-eq (edge2-frame test-frame) (cons 0 1))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define edge2-frame cddr)

(define test-frame (make-frame (cons 0 0) (cons 1 0) (cons 0 1)))

(assert-eq (origin-frame test-frame) (cons 0 0))
(assert-eq (edge1-frame test-frame) (cons 1 0))
(assert-eq (edge2-frame test-frame) (cons 0 1))

