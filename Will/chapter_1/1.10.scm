; done - but do some research on the Ackerman function
(load "test-lib.scm")

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
  (else (A (- x 1)
           (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (display-1-to-n f n)
  (display "\n")
  (display (f n))
  (if (= n 0)
    (display (f 0))
    (display-1-to-n f (- n 1))))

(define (square x)
  (* x x))


; f is (* 2 n)
; g is 2 ^ n
; h is n ^ n
; more generally, the Ackerman function represents the idea of repeatedly applying a function - 
; so multiplication is repeated addition, exponentiation is repeated multiplication, and so on.


