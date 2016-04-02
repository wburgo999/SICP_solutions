(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define golden-ratio
  (fixed-point .00001 (lambda (y) (+ 1 (/ 1 y))) 1.0))

(disp golden-ratio)
