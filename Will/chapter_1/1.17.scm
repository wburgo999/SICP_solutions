(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (double x)
  (* x 2))

(define (halve x)
  (if (odd? x)
    (error "halve" "only works for even numbers")
  (/ x 2)))

(define (mult-recursive a b)
  (disp "a: " a "b: " b)
    (cond ((= a 0) 0)
          ((odd? a) (+ b (mult-recursive (- a 1) b)))
          (else (double (mult-recursive (halve a) b)))))


(disp (mult-recursive 7 13))


