; box and pointer model done on paper, but do in LaTeX
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define x (list 1 (list 2 (list 3 4))))
; by subsitution model, becomes

(disp (cons 1
            (cons (cons 2
                        (cons (cons 3 (cons 4 '()))
                              '()))
                  '())))

; which the interpreter prints as (1 (2 (3 4)))

; tree
    .
  /   \
1      (2 (3 4))
         /   \
        2    (3 4)
              / \
             3   4
