; done
; purpose: understand that a list of quoted items can be compared to another
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")


(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((or (not (pair? a)) (not (pair? b))) #f)
        (else (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))))

(assert-eq (equal? 1 1) #t)
(assert-eq (equal? 2 1) #f)
(assert-eq (equal? 'a 'a) #t)
(assert-eq (equal? (list 1 2 3) (list 1 2 3)) #t)
(assert-eq (equal? (list 2 3 4) (list 2 3)) #f)
(assert-eq (equal? 1 1) #t)

