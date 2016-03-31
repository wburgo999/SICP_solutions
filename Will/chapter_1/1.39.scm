; done
; why is negative a procedure?
; what has parenthesis and doesn't?
(load "../utils.scm")
(load "../test-lib.scm")

(define (cont-frac-tan x k)
  (define n 
    (lambda (i) 
      (if (= i 1)
        x
        (- (expt x 2)))))
  (define d (lambda (i) (+ 1 (* 2 (- i 1)))))
  (cont-frac n d k))

(disp (cont-frac-tan 1.5 5))
(disp (cont-frac-tan 2 5))

