(load "utils.scm")
(load "test-lib.scm")

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(assert-eq (a-plus-abs-b 1 3) 4)
(assert-eq (a-plus-abs-b 3 -4) 7)

;further practice
(define (square-even-cube-odd n)
  ((if (is-even? n)
    square
    cube)
   n))

(assert-eq (square-even-cube-odd 4) 16)
(assert-eq (square-even-cube-odd 3) 27)
