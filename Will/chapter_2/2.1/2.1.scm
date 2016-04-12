(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (make-rat n d)
  (let ((a (/ n (gcd n d)))
        (b (/ d (gcd n d))))
    (if (negative? b)
      (cons (- a) (- b))
      (cons a b))))

(define numer car)
(define denom cdr)

(define one-third (make-rat 2 6))
(define neg-three-halves (make-rat 9 -6))

(assert-eq (numer one-third) 1)
(assert-eq (denom one-third) 3)
(assert-eq (numer neg-three-halves) -3)
(assert-eq (denom neg-three-halves) 2)


