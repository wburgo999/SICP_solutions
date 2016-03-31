(load "../utils.scm")
(load "../test-lib.scm")

(define (product a b f next)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (f a)))))
  (iter a 1))

(define (product-recursive a b f next)
  (if (> a b)
    1
    (* (f a) 
       (product-recursive (next a) b f next))))

(define (product-integers a b)
  (product a b identity inc))

(define (product-sum-2 a b)
  (product a b square (lambda (y) (+ y 2))))

(define (factorial n)
  (product 1 n identity inc))

(define (factorial-recursive n)
  (product-recursive 1 n identity inc))

(define (pi a b)
  (define (term y)
    (if (odd? y) 
      (/ (+ y 1) (+ y 2))
      (/ (+ y 2) (+ y 1))))
  (* 4 (product a b term inc)))

(assert-eq (product-integers 1 5) 120)
(assert-eq (product-sum-2 1 6) 225)
(assert-eq (factorial 5) 120)
(assert-close (pi 1 100) 3.14)
(assert-eq (factorial-recursive 5) 120)


