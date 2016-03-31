(load "../utils.scm")
(load "../test-lib.scm")

(define (compose f g)
  (lambda (x) (f (g x))))

