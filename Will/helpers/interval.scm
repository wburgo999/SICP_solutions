(load "utils.scm")
(load "test-lib.scm")

(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b))
                 (+ (upper-bound a) (upper-bound b))))

(define (sub-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (make-interval (min (- a c) (- a d))
                   (max (- b c) (- b d)))))

(define (mul-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (make-interval 
      (min (* a c) (* a d) (* b c) (* b d))
      (max (* a c) (* a d) (* b c) (* b d)))))

(define (div-interval a b)
  (define (contains-zero? interval)
    (and (positive? (upper-bound interval)) (negative? (lower-bound interval))))
  (if (contains-zero? b)
    (error "Cannot divide by 0 - undefined")
    (mul-interval
      a
      (make-interval (/ 1.0 (upper-bound b)) (/ 1.0 (lower-bound b))))))

(define (width interval)
  (/ (abs (- (upper-bound interval) (lower-bound interval))) 2))

(define (make-interval-cw center width)
  (make-interval (- center width) (+ center width)))

(define (center interval)
  (average (lower-bound interval) (upper-bound interval)))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define (make-center-percent center percent)
  (make-interval-cw center (* percent center)))

(define (percent interval)
  (/ (- (center interval) (lower-bound interval)) (center interval)))

(define (print-interval interval)
  (display "[")
  (display (lower-bound interval))
  (display ", ")
  (display (upper-bound interval))
  (display "]")
  (newline))



