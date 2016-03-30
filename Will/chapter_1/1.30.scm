(load "utils.scm")
(load "test-lib.scm")
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
    (iter a 0))

(disp (sum-iter identity 1 inc 10))
