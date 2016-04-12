; todo - can't figure out. and redo when done
; purpose: teach how to recurse down tree structures
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")


(define (fringe tree)
  (define (iter tree result)
    (cond ((null? tree) result)
          ((pair? (car tree))
           (iter (cdr tree) (append result (fringe (car tree)))))
          (else (iter (cdr tree) (append result (list (car tree)))))))
  (iter tree '()))

; another cool way, using an if condition to return the appropriate procedure
(define (fringe-other tree)
  (define (iter tree result)
    (if (null? tree)
      result
      (iter (cdr tree)
            (append result
                    ((if (pair? (car tree)) fringe list) (car tree))))))
  (iter tree '()))

(define x (list (list 1 2) (list 3 4)))

(assert-eq (fringe x) (list 1 2 3 4))
(assert-eq (fringe (list x x)) (list 1 2 3 4 1 2 3 4))
(assert-eq (fringe-other x) (list 1 2 3 4))
(assert-eq (fringe-other (list x x)) (list 1 2 3 4 1 2 3 4))

