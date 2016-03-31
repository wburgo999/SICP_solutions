;done
(load "../utils.scm")
(load "../test-lib.scm")

(define (largest-two-square-sum x y z)
  (if (= (larger x y) x)
    (sum-of-squares x (larger y z))
    (sum-of-squares y (larger x z))))

(define (larger x y)
  (if (> x y) x y))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(assert-eq (largest-two-square-sum 1 2 3) 13)
(assert-eq (largest-two-square-sum 10 2 3) 109)
