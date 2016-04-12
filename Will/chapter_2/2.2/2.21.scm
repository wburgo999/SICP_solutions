(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define numbers (list 1 2 3 4 5 6 7 8 9 10))

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items))
          (square-list (cdr items)))))

(assert-eq (square-list numbers) (list 1 4 9 16 25 36 49 64 81 100))

(define (square-list items)
  (map square items))

(assert-eq (square-list numbers) (list 1 4 9 16 25 36 49 64 81 100))
