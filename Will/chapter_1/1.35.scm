(load "utils.scm")
(load "test-lib.scm")
(define golden-ratio
  (fixed-point .00001 (lambda (y) (+ 1 (/ 1 y))) 1.0))

(disp golden-ratio)
