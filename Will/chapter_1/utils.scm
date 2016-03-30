(define (disp . vs)
     (for-each display vs)
     (display "\n"))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (inc-n n) (lambda (y) (+ y n)))

(define (dec x) (- x 1))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

(define (average3 x y z)
  (/ (+ x y z) 3))

(define (is-even? n)
  (= (modulo n 2) 0))

(define (is-odd? n)
  (not (is-even? n)))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (diff-percent a b)
  (abs (/ (- a b) b)))

(define (close? bound approximation actual)
  (< (diff-percent approximation actual) 
     bound))

(define (close-abs? bound approximation actual)
  (< (abs (- approximation actual)) bound))

; PRIMES
(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? n test-divisor) test-divisor)
          (else (find-divisor n (next test-divisor )))))
  (define (divides? n divisor)
    (= (remainder n divisor) 0))
  (define (next n)
    (if (= n 2)
      3
      (+ n 2)))
  (find-divisor n 2))

(define (prime? n)
  (if (< n 2)
    #f
    (= n (smallest-divisor n))))

; accumulator/ reduce
(define (accumulate combiner null-value a b term next)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum a b term next)
  (accumulate + 0 a b term next))

(define (product a b term next)
  (accumulate * 1 a b term next))

;Greatest common divisor
(define (gcd a b)
  (define (iter a b)
    (if (= b 0)
      a
      (gcd b (remainder a b))))
  (iter (max a b) (min a b)))

;LOOPS - how to test??
(define (for start end next f)
  (define (iter start)
    (if (<= start end)
      (begin 
        (f start)
        (iter (next start)))))
  (iter start))

; find Zeroes
(define (find-zero neg pos f)
  (define (iter neg pos)
    (let ((midpoint (average neg pos)))
      (cond ((close-abs? .01 (f midpoint) 0) midpoint)
            ((> (f midpoint) 0) (iter neg midpoint))
            (else (iter midpoint pos)))))
  (iter neg pos))

(define (half-interval f neg pos)
  (cond ((and (positive? (f pos)) (negative? (f neg))) (find-zero neg pos f))
        ((and (positive? (f neg)) (negative? (f pos))) (find-zero pos neg f))
        (else (error "Values are not of opposite sign"))))

(define (fixed-point tolerance f guess)
  (if (close-abs? tolerance (f guess) guess)
    guess
    (fixed-point tolerance f (f guess))))

; cont fractions
(define (cont-frac n d k)
  (define (iter index)
    (if (= index k)
      (/ (n k) (d k))
      (/ (n index) (+ (d index) (iter (inc index))))))
  (iter 1))

(define (e-2) 
  (define n (lambda (i) 1))
  (define d 
    (lambda (i)
      (if (= (remainder i 3) 2)
        (* 2 (ceiling (/ i 3)))
        1)))
  (cont-frac n d 29))

; calculus
(define (derivative f x)
  (let ((dx .0001))
    (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) (derivative g x)))))

(define (newtons-method g)
    (fixed-point .001 (newton-transform g) 1.0))

; abstract
(define (repeated f n)
  (define (iter count result)
    (if (= count n)
      result
      (iter (inc count) (compose f result))))
  (iter 1 f))

