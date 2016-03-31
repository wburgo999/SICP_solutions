(load "../utils.scm")
(load "../test-lib.scm")

(define (double f)
  (lambda (x) (f (f x))))

(disp ((double inc) 4))

(disp ((double square) 2))

