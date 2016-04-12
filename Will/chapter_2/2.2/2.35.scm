(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (count-leaves tree)
  (accumulate (lambda (sub-tree num)
                (if (pair? sub-tree)
                  (+ (count-leaves sub-tree) num)
                  (+ num 1)))
              0 tree))

(define test-tree (list 1 2 (list 3 4) 5 (list 6 7)))
(assert-eq (count-leaves test-tree) 7)
