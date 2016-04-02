(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

