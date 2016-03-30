(load "utils.scm")
(load "test-lib.scm")

(define (filtered-accumulate combiner null-value a b f next test)
  (define (iter a result)
    (if (> a b)
      result
      (cond ((test a) (iter (next a) (combiner result (f a))))
            (else (iter (next a) result)))))
  (iter a null-value))

(define (filtered-accumulate-recursive combiner null-value a b f next test)
  (if (> a b)
    null-value
    (if (test a)
      (combiner (f a) (filtered-accumulate-recursive combiner null-value (next a) b f next test))
      (filtered-accumulate-recursive combiner null-value (next a) b f next test))))

(define (even-sum a b)
  (filtered-accumulate + 0 a b identity inc even?))

(define (even-sum-recursive a b)
  (filtered-accumulate-recursive + 0 a b identity inc even?))

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 a b identity inc prime?))

(define (product-relative-primes n)
  (define test (lambda (y) (= (gcd n y) 1)))
  (filtered-accumulate * 1 1 n identity inc test))

(assert-eq (even-sum 1 5) 6)
(assert-eq (even-sum-recursive 1 5) 6)
(assert-eq (sum-prime-squares 1 5) 10)
(assert-eq (product-relative-primes 7) 720)

