;; requires random-bsd, vector-lib
;; square of a number
(define (square x)
  (* x x))

;; return the sum of squares of the larger two out of three numbers
(define (sumOfSquaresOfLargerTwo x y z)
  (+ (square (max x y)) (square (max x z))))

(print (sumOfSquaresOfLargerTwo 548.390856275813 286.093668626267 434.584923762312))

;; generate random numbers between 0 and 1000(
(use random-bsd)
(use vector-lib)

(define threeRandomRealsVector (vector-map (lambda (x y) (+ (random 1000) (random-real)) ) (make-vector 3)))

;; TBC

