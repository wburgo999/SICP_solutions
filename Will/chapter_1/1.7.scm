(load "utils.scm")
(load "test-lib.scm")

(define (square-root n)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (define (improve guess)
    (average guess (/ n guess)))
  (define (good-enough? guess)
    (< (abs (- 1
           ( / (square guess) n)))
      .01))
  (sqrt-iter 1.0))

(assert-within (square-root 9) 3 .001)
(assert-close (square-root 9) 3)


