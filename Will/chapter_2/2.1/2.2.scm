(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint segment)
  (make-point
    (/ (+ (x-point (start-segment segment))
          (x-point (end-segment segment)))
       2)
    (/ (+ (y-point (start-segment segment))
          (y-point (end-segment segment)))
       2)))

(define (print-point point)
  (disp "(" (x-point point) ", " (y-point point) ")"))


(define (print-segment segment)
  (display "START: ")
  (print-point (start-segment segment))
  (display "END: ")
  (print-point (end-segment segment)))

(define p1 (make-point 1 2))
(define p2 (make-point 5 6))
(define line1 (make-segment p1 p2))

(print-point p1)
(print-point p2)
(print-point (start-segment line1))
(print-point (end-segment line1))
(print-segment line1)
(print-point (midpoint line1))

