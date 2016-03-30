;//TODO - write out explanation 
(load "test-lib.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(test-eq (new-if (= 1 1) 0 5) 0)
(test-eq (new-if (= 2 3) 0 5) 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve-guess x)
                     x)))
(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) .001))

(test-eq (good-enough? 2 5) #f)
(test-eq (good-enough? 2 4) #t)
