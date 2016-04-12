(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (my-reverse sequence)
  (fold-right 
    (lambda (a b) (append b (list a)))
    '()
    sequence))

(assert-eq (my-reverse (enumerate 1 5)) (list 5 4 3 2 1))

(define (my-reverse sequence)
  (fold-left
    (lambda (a b) (cons b a))
    '()
    sequence))

(assert-eq (my-reverse (enumerate 1 5)) (list 5 4 3 2 1))


