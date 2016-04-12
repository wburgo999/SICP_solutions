(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define evens (list 2 4 6 8 10))

(define (last-pair items)
  (if (null? (cdr items))
    items
    (last-pair (cdr items))))

(assert-eq (last-pair evens) (list 10))
(assert-eq (last-pair evens) (cons 10 '()))

