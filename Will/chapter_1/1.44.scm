(load "../utils.scm")
(load "../test-lib.scm")

(define (smooth f)
  (let ((dx .001))
    (lambda (x) 
      (average3 (f (- x dx)) (f x) (f (+ x dx))))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define smoothed-square (smooth square))

(define smoothed-square-10-fold (n-fold-smooth square 10))

(assert-close (smoothed-square-10-fold 3) 9)

(assert-close (smoothed-square 3) 9)


