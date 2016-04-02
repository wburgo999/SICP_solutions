; TODO: write out explanation
(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (f g)
  (g 2))

(disp (f f))

