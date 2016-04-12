(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(load "2.46.scm")

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define u (make-vect 1 2))
(define v (make-vect 3 4))

(define test-segment (make-segment u v))

(assert-eq (start-segment test-segment) u)
(assert-eq (end-segment test-segment) v )
