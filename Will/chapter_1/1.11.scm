(load "../utils.scm")
(load "../test-lib.scm")

(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (* 2 (f-recursive (- n 2)))
       (* 3 (f-recursive (- n 3))))))

(define (f-iter n)
  (define (f a b c counter)
    (if (not (eq? counter 0))
      (f a b c (- counter 1))))
  (f 0 0 0 n))

; the trick here is to start at n = 0 and build your way up
(define (f-iter n)
  (define (f-iter counter new-term old-term old-old-term)
    (if (= counter 0)
      old-old-term
      (f-iter (- counter 1)
              (+ new-term (* 2 old-term) (* 3 old-old-term))
              new-term
              old-term)))
  (f-iter n 2 1 0))

(assert-eq (f-iter 0) 0)
(assert-eq (f-iter 1) 1)
(assert-eq (f-iter 2) 2)
(assert-eq (f-iter 3) 4)
(assert-eq (f-iter 4) 11)
(assert-eq (f-iter 5) 25)




