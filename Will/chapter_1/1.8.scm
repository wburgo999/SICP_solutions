(load "../utils.scm")
(load "../test-lib.scm")

(define (cube-root n)
  (define (cube-iter guess)
    (if (good-enough? guess)
      guess
      (cube-iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- (cube guess) n))
       (* .01 n)))

  (define (improve guess)
    (/ (+
         (/ n (square guess))
         (* 2 guess))
       3))

  (cube-iter 1.0))

(assert-close (cube-root 8) 2)

