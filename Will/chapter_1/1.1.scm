(load "../utils.scm")
(load "../test-lib.scm")

(display "Expected: 10, Actual: ")
(display 10)

(display "\nExpected: 12 Actual: ")
(display (+ 5 3 4))

(display "\nExpected: 12 Actual: ")
(display (- 9 1))

(display "\nExpected: 12 Actual: ")
(display (/ 6 2))

(display "\nExpected: 12 Actual: ")
(display (+ (* 2 4) (- 4 6)))

(define a 3)
(define b (+ a 1))

(display "\nExpected: 19 Actual: ")
(display (+ a b (* a b)))

(display "\nExpected: #f Actual: ")
(display (= a b))

(display "\nExpected: 4 Actual: ")
(display (if (and (> b a) (< b (* a b)))
           b
           a))

(display "\nExpected: 16 Actual: ")
(display (cond ((= a 4) 6)
               ((= b 4) (+ 6 7 a))
               (else 25)))

(display "\nExpected: 6 Actual: ")
(display (+ 2 (if (> b a) b a)))

(display "\nExpected: 16 Actual: ")
(display (* (cond ((> a b) a)
                  ((< a b) b)
                  (else -1))
            (+ a 1)))

