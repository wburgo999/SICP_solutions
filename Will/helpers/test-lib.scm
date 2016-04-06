(define (assert-eq x y)
  (if (not (deep-equal? x y))
    (disp "Expected: " y " Actual: " x)))

(define (assert-within x y band)
  (if (not (< (abs (- x y)) band))
    (disp x " is not within " band " of expected " y)))

(define (assert-close x y)
  (if (not (< (abs (- x y))
              .01))
    (disp "Result: " x " is not close to Expected: " y)))

(define (deep-equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (null? a) (not (null? b))) #f)
        ((and (not (null? a)) (null? b)) #f)
        ((and (pair? a) (not (pair? b))) #f)
        ((and (not (pair? a)) (pair? b)) #f)
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        (else (and (eq? (car a) (car b)) (deep-equal? (cdr a) (cdr b))))))

; utility procedure that allows you to use display with arbitrary number of arguments
(define (disp . elements)
     (for-each display elements)
     (display "\n"))


