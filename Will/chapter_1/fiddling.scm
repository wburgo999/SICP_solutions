;randome fiddling around / practicing examples in book
(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (sum a b f next)
  (if (> a b)
    0
    (+ (f a) 
       (sum (next a) b f next))))

(define (sum-integers a b)
  (sum a b identity inc))

(display "hello")

(define (sum-cubes a b)
  (sum a b cube inc))

(define (sum-pi a b)
  (sum a b 
       (lambda (y) (/ 1 (* y (+ y 2))))
       (lambda (y) (+ y 4))))

(define (integral f a b dx)
  (sum a b 
       (lambda (y) (* (f (+ y (/ dx 2))) dx))
       (lambda (y) (+ y dx))))

(define (f-xy x y)
  (let ((a (+ 1 (* x y))) 
        (b (- 1 y)))
    (+ (* x (square a)) (* y b) (* a b)))) 

(define (f-xy-defn x y)
  (define (helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (helper (+ 1 (* x y)) (- 1 y)))

(define (f-xy-lambda x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (fixed-point tolerance f guess)
  (if (close-abs? tolerance (f guess) guess)
    guess
    (fixed-point tolerance f (f guess))))

(define (sqrt-fixed-point n)
  (fixed-point .01 (lambda (y)
                     (average y (/ n y)))
               1.0))

(define (sqrt-damp n)
  (fixed-point .01 
               (average-damp (lambda (y) (/ n y)))
               1.0))
(define (cube-damp n)
  (fixed-point .01 
               (average-damp (lambda (y) (/ n (square y))))
               1.0))

(define (fixed-point-of-transform g transform guess)
  (fixed-point .01 (transform g) guess))

(define (sqrt-first n)
  (fixed-point-of-transform (lambda (x) (/ n x)) average-damp 1.0))

(define (sqrt-newton n)
  (fixed-point-of-transform (lambda (x) (- (square x) n)) newton-transform 1.0))

(disp (sqrt-first 9))
(disp (sqrt-newton 9))



