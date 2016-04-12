; done
; purpose: to show that accumulate is really anything. You can do anything you want with accumulate
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (horner-eval coefficients x)
  (accumulate 
    (lambda (a b)
      (+ a (* x b))) 
    0
    coefficients))

(define test-polynomial (list 2 4 3 2))
(define test-val 3)
(define expected-answer (+ (* 2 (expt 3 3)) (* 3 (expt 3 2)) (* 4 (expt 3 1)) 2))

(assert-eq (horner-eval test-polynomial test-val) expected-answer)

