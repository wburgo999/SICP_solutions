(load "utils.scm")
(load "test-lib.scm")

(define (accumulate combiner null-value a b f next)
  (if (> a b)
    null-value
    (combiner (f a)
              (accumulate combiner null-value (next a) b f next))))

(define (accumulate-iter combiner null-value a b f next)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (f a)))))
  (iter a null-value))

(define (sum-acc a b f next)
  (accumulate + 0 a b f next))

(define (prod-acc a b f next)
  (accumulate * 1 a b f next))

(define (sum-acc-iter a b f next)
  (accumulate-iter + 0 a b f next))

(define (prod-acc-iter a b f next)
  (accumulate-iter * 1 a b f next))

(disp (sum-acc 1 10 identity inc))
(disp (prod-acc 1 5 identity inc))
(disp (sum-acc-iter 1 10 identity inc))
(disp (prod-acc-iter 1 5 identity inc))

