; done
; purpose: gradually build up a library. dotproduct => m*v is a map of dotproducts => m*m is a map of m*vs
; again, shows how accumulate can do anything. It's just a means of combining sequences
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define make-vec list)
(define make-mat list)

(define (dot-product u v)
  (accumulate + 0 (accumulate-n * 1 (list u v))))

(define (matrix-*-vector m v)
  (map
    (lambda (row) (dot-product row v))
    m))

(define (transpose matrix)
  (accumulate-n cons '() matrix))

(define (matrix-*-matrix m n)
  (let ((n-transpose (transpose n)))
    (map (lambda (vec)
           (matrix-*-vector m vec))
         n-transpose)))


(define test-vec-1 (list 1 2 3))
(define test-vec-2 (list 4 5 6))
(define test-vec-3 (list 7 8 9))
(define test-mat-1 (list test-vec-1 test-vec-2 test-vec-3))
(define test-mat-2 (list test-vec-1 test-vec-1 test-vec-1))

(assert-eq (dot-product test-vec-1 test-vec-2) 32)
(assert-eq (matrix-*-vector test-mat-1 test-vec-1) (list 14 32 50))
(assert-eq (transpose test-mat-1) (list (list 1 4 7) (list 2 5 8) (list 3 6 9)))
(assert-eq (matrix-*-matrix test-mat-1 test-mat-1) (list (list 30 66 102) (list 36 81 126) (list 42 96 150)))



