(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
  (else (A (- x 1)
           (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(assert-eq (f 1) 2)
(assert-eq (f 2) 4)
(assert-eq (f 3) 6)
(assert-eq (f 4) 8)
(assert-eq (f 5) 10)

; f is (* 2 n)

(assert-eq (g 1) 2)
(assert-eq (g 2) 4)
(assert-eq (g 3) 8)
(assert-eq (g 4) 16)
(assert-eq (g 5) 32)

; g is 2 ^ n

(assert-eq (h 1) 2)
(assert-eq (h 2) 4)
(assert-eq (h 3) 16)
(assert-eq (h 4) 65536)

; h is 2 ^ 2 ^ 2 ..... ^ 2   n times

; more generally, the Ackerman function represents the idea of repeatedly applying a function - 
; so multiplication is repeated addition, exponentiation is repeated multiplication, and so on.


