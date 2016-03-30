(define (disp . vs)
     (for-each display vs)
     (display "\n"))

(define (assert-eq x y)
  (if (not (eq? x y))
    (disp "Expected: " y " Actual: " x)))

(define (assert-within x y band)
  (if (not (< (abs (- x y)) band))
    (disp x " is not within " band " of expected " y)))

(define (assert-close x y)
  (if (not (<
             (abs (- x y))
              .01))
    (disp "Result: " x " is not close to Expected: " y)))

(define (disp-range f n)
  (define (range counter)
    (if (not (eq? counter n))
      (begin
        (disp (f counter))
        (range (+ counter 1)))))
  (range 1))


