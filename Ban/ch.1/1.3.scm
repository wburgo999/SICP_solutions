(load "../lib/prob.scm")
(load "../lib/math.scm")


;; return the sum of squares of the larger two out of three numbers
(define (sumOfSquaresOfLargerTwo x y z)
  (+ (square (max x y))
     (square (if (> x y) (max y z) (max x z))
			 )))
			 

;; generate 3-dimensional uniformly-distributed real vector between -1000 and 1000
;; test sumOfSquaresOfLargerTwo 
(define A (gen-uniform-reals-vector 1000 3))

(define (test)
  (let ((x (vector-ref A 0))
	(y (vector-ref A 1))
	(z (vector-ref A 2)))
	(print "\nx =" x
	       "\ny =" y
	       "\nz =" z
	       "\n(square x) =" (square x)
	       "\n(square y) =" (square y)
	       "\n(square z) =" (square z)
	       "\n(sumOfSquareOfLargerTwo x y z) ="
	       (sumOfSquaresOfLargerTwo x y z)
	       "\n")))

(define foo (test))



	       
	       



