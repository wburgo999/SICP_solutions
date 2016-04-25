;; applicative-order vs normal-order evaluation

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(print "Kill run and open file to read comments for explanation\n")
       
;;

(test 0 (p))

;; In applicative-order evaluation, the interpreter
;; evaluates the operator and operands first and
;; then applies the resulting procedure, therefore,
;; when evaluating the function `test' with an
;; interpreter that uses applicative-order evaluation,
;; (p) will be evaluated before the `if' expression
;; in `test'. When the interpreter attempts to evaluate
;; and apply the procedure (p) (via the substitution model?)
;; it will enter an infinite loop---see definition of
;; (p).
;;
;; In normal-order evaluation, however, the interpreter
;; will fully expand `test' and only evaluate operands when
;; their values are needed. In this case, observing
;; that the first argument of `test' is 0, the procedure (p) 
;; will never be evaluated because the predicate of the `if'
;; expression evaluates to a true value causing the
;; interpreter to evaluate the ``consequent" and not the
;; ``alternative," which is the procedure (p).
;;
;; Note that the application of `test' procedure using
;; the substitution model yielded an "illegitimate"
;; value where the normal-order and applicative-order
;; evaluation did not give the same result. (see page 21 in
;; pdf version of book)
