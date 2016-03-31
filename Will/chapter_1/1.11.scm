; TODO iter
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



