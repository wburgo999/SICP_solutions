(define (disp . vs)
     (for-each display vs)
     (display "\n"))

(define (assert-eq x y)
  (if (not (deep-equal? x y))
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

(define (deep-equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (null? a) (not (null? b))) #f)
        ((and (not (null? a)) (null? b)) #f)
        ((and (pair? a) (not (pair? b))) #f)
        ((and (not (pair? a)) (pair? b)) #f)
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        (else (and (eq? (car a) (car b)) (deep-equal? (cdr a) (cdr b))))))


