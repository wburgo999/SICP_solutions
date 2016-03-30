; TODO: write out explanation
(load "utils.scm")
(load "test-lib.scm")

(define (f g)
  (g 2))

(disp (f f))

