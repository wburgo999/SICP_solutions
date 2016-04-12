;done - do recursive
;purpose: to teach you about 'consing up' and 'cdring down'
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define evens (list 2 4 6 8 10))

(define (reverse-list items)
  (define (iter items reversed-items)
    (if (null? items)
      reversed-items
      (iter (cdr items) (cons (car items) reversed-items))))
  (iter items '()))

(assert-eq (reverse-list evens) (list 10 8 6 4 2))
