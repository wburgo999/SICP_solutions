; done - but redo, feels like luck again
; purpose: abstractions!
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define test-tree (list 1 (list 2 (list 3 4) 5 (list 6 7))))

(define tree-map
  (lambda (proc tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
         tree)))


(define (square-tree tree)
  (tree-map square tree))

(assert-eq (square-list test-tree) (list 1 (list 4 (list 9 16) 25 (list 36 49))))

