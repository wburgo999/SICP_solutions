(load "utils.scm")
(load "test-lib.scm")

(define (smooth f)
  (let ((dx .001))
    (lambda (x) 
      (average3 (f (- x dx)) (f x) (f (+ x dx))))))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))

(define smoothed-square (smooth square))
(disp (smoothed-square 2))
(disp ((n-fold-smooth square 3) 2))



