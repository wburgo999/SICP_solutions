(load "../utils.scm")
(load "../test-lib.scm")

(define (square-root n)
  (define (sqrt-iter guess previous-guess)
    (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess) guess)))
  (define (improve guess)
    (average guess (/ n guess)))
  (define (good-enough? guess previous-guess)
    (< (abs (- 1 ( / previous-guess guess )))
      .01))
  (sqrt-iter 1.0 n))

(assert-within (square-root 9) 3 .001)
(assert-close (square-root 9) 3)

; This solution does not work when guess is 0 - you can't divide by zero.
; But this would never actually happen. Since the guess is initialized to 1.0
; and we obtain a new guess by averaging guess and (/ n guess), we will never actually 
; reach 0; we would at most get arbitrarily close.

; The only exception would be negative numbers. Take n = -1.0, then after the first
; iteration, (average 1.0 (/ -1.0 1.0)) is 0. But our algorithm was never designed to 
; handle negative numbers, which result in imaginary results, so this method 
; works well for our use-case



