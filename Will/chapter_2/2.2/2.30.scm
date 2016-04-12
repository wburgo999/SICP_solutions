(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")


(define test-tree (list 1 (list 2 (list 3 4) 5 (list 6 7))))

(define (square-list tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-list sub-tree)
           (square sub-tree)))
       tree))

(assert-eq (square-list test-tree) (list 1 (list 4 (list 9 16) 25 (list 36 49))))

