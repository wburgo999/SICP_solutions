(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define numbers (list 1 2 3 4 5 6 7 8 9 10))

(define (for-each proc items)
  (proc (car items))
  (if (not (null? (cdr items)))
    (for-each proc (cdr items))))

(define disp-square (lambda (x) (disp (square x))))

(for-each disp-square numbers) ; prints square of each number in the list
; can't test with assert since there are no return values - just side-effects.
