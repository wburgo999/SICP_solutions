(load "utils.scm")
(load "test-lib.scm")

(define (cubic a b c)
  (lambda (x) 
    (+
      (cube x)
      (* a (square x))
      (* b x)
      c)))

(disp (newtons-method (cubic 2 3 4)))

