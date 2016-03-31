(load "../utils.scm")
(load "../test-lib.scm")

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? n test-divisor) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? n divisor)
    (= (remainder n divisor) 0))
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))


(disp (smallest-divisor 199))
(disp (smallest-divisor 1999))
(disp (smallest-divisor 19999))

