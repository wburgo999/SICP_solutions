(load "../lib/math.scm")

;; cond vs if
;; footnote on page 24 of pdf version of book:
;; "A minor difference between if and cond is that the ⟨e⟩ part of each cond clause
;; may be a sequence of expressions. If the corresponding ⟨p⟩ is found to be true,
;; the expressions ⟨e⟩ are evaluated in sequence and the value of the final expression
;; in the sequence is returned as the value of the cond. In an if expression, however,
;; the ⟨consequent ⟩ and ⟨alternative⟩ must be single expressions."

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;; __________________________________________________________________________________

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))


(define (sqrt-iter-new-if guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

(print (sqrt-iter 1.0 7))
(print (sqrt-iter-new-if 1.0 7))

;; ??


