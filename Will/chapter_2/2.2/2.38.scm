; done
; purpose: to show you fold-right and fold-left
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (fold-right proc null-value sequence)
  (if (null? sequence)
    null-value
    (proc (car sequence) 
          (fold-right proc null-value (cdr sequence)))))

(define (fold-left proc null-value sequence)
  (define (iter items result)
    (if (null? items)
      result
      (iter (cdr items) (proc result (car items)))))
  (iter sequence null-value))


(assert-eq (fold-right + 10 (enumerate 1 5)) 25)
(assert-eq (fold-left + 10 (enumerate 1 5)) 25)


; 2.38
(assert-close (fold-right / 1 (list 1 2 3)) 1.5)
(assert-close (fold-left / 1 (list 1 2 3)) (/ 1 6))
(assert-eq (fold-right list '() (list 1 2 3)) (list 1 (list 2 (list 3 '()))))
(assert-eq (fold-left list '() (list 1 2 3)) (list (list (list '() 1) 2) 3))








