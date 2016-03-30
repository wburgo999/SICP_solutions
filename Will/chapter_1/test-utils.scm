(load "utils.scm")
(load "test-lib.scm")

(assert-eq (identity 4) 4)

(assert-eq (inc 4) 5)

(assert-eq ((inc-n 4) 5) 9)

(assert-eq (dec 4) 3)

(assert-eq (square 4) 16)
(assert-eq (square -9) 81)
(assert-eq (square 0) 0)

(assert-eq (cube 4) 64)
(assert-eq (cube -9) -729)
(assert-eq (cube 0) 0)

(assert-eq (average 4 0) 2)
(assert-eq (average -9 9) 0)
(assert-eq (average -32 78) 23)

(assert-eq (average3 4 0 2) 2)
(assert-eq (average3 -9 9 30) 10)
(assert-eq (average3 -32 78 -10) 12)

(assert-eq (is-even? 4) #t)
(assert-eq (is-even? -3) #f)
(assert-eq (is-even? 0) #t)

(assert-eq (is-odd? 4) #f)
(assert-eq (is-odd? -3) #t)
(assert-eq (is-odd? 0) #f)
(assert-eq (is-odd? 7) #t)

(assert-eq ((average-damp square) 10) 55)

(assert-close (diff-percent 7.7 7) .1)

(assert-eq (close? .1 8 9) #f)
(assert-eq (close? .1 8 8.5) #t)

(assert-eq (close-abs? .1 8 8.09) #t)
(assert-eq (close-abs? .1 8 8.19) #f)

(assert-eq (prime? 7) #t)
(assert-eq (prime? 12) #f)
(assert-eq (prime? 103) #t)
(assert-eq (prime? 1) #f)
(assert-eq (prime? -1) #f)

(assert-eq (sum 1 10 identity inc) 55)
(assert-eq (sum 1 3 cube inc) 36)
(assert-eq (sum 1 10 square (lambda (y) (+ y 4))) 107)

(assert-eq (product 1 5 identity inc) 120)
(assert-eq (product 1 3 cube inc) 216)
(assert-eq (product 1 6 square (lambda (y) (+ y 4))) 25)

(assert-eq (gcd 1 5) 1)
(assert-eq (gcd 20 40) 20)
(assert-eq (gcd 18 12) 6)

(assert-close (half-interval sin 2 4) 3.14)

(assert-close (fixed-point .01 (lambda (y) (average y (/ 9.0 y))) 1.0) 3.0)

(assert-close (e-2) .718)


(assert-close (derivative cube 4) 48)
(assert-close (newtons-method square) 0)
(assert-close (newtons-method (lambda (x) (- x 2))) 2)

(assert-eq ((repeated square 3) 2) 256)
(assert-eq ((repeated inc 10) 3) 13)
