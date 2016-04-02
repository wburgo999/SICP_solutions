(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (double x)
  (* x 2))

(define (halve x)
  (if (odd? x)
    (error "halve" "only works for even numbers")
  (/ x 2)))

(define (mult a b)
  (define (mult-iter a b total)
    (cond ((eq? a 0) total)
          ((odd? a) (mult-iter (- a 1) b (+ b total)))
          (else (mult-iter (halve a) b (double total)))))
  (mult-iter a b 0))

