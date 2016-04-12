; todo - I never seem to be able to do this problem
; purpose
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append
        rest
        (map (lambda (subset)
               (append (list (car s)) subset))
             rest)))))


(print (subsets (list 1 2 3)))
                         
