(load "../utils.scm")
(load "../test-lib.scm")

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough? guess)
        guess
        (iter (improve guess))))
    (iter guess)))

(define (fixed-point tolerance improve)
  (define (good-enough? guess)
    (< (abs (/ (- guess (improve guess)) guess))
       tolerance))
  (iterative-improve good-enough? improve))

(assert-close ((fixed-point .0001 cos) -1) .739)


