(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (split proc1 proc2)
  (lambda (painter n)
    (if (= n 0)
      painter
      (proc1 painter (proc2 ((split proc1 proc2) painter (- n 1))
                            ((split proc1 proc2) painter (- n 1)))))))


