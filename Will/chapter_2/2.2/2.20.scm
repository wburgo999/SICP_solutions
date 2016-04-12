(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define same-parity? (lambda (a b) (= (remainder a 2) (remainder b 2))))

(define (same-parity first . items)
  (define (iter items result)
    (if (null? items) 
      result
      (if (same-parity? first (car items))
        (iter (cdr items) (append result (list (car items))))
        (iter (cdr items) result))))
  (iter items (list first)))

(assert-eq (same-parity? 7 4) #f)
(assert-eq (same-parity? 6 4) #t)

(assert-eq (same-parity 1 2 3 4 5 6 7 8 9 10) (list 1 3 5 7 9))
