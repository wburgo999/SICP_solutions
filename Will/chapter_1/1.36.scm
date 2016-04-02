(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (fixed-point tolerance f guess)
  (display guess)
  (newline)
  (if (close-abs? tolerance (f guess) guess)
    guess
    (fixed-point tolerance f (f guess))))

(fixed-point .001 (lambda (y) (/ (log 1000) (log y))) 2.0)
(fixed-point .001 (lambda (y) (average y (/ (log 1000) (log y)))) 2.0)
