(define (assert-eq x y)
  (if (not (equal? x y))
    (print "Expected: " y " Actual: " x)))

(define (assert-within x y band)
  (if (not (< (abs (- x y)) band))
    (print x " is not within " band " of expected " y)))

(define (assert-close x y)
  (if (not (< (abs (- x y)) .01))
    (print "Result: " x " is not close to Expected: " y)))



