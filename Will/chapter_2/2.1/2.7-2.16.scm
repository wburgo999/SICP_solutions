; done, 2.7 - 2.16
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

; constructors and selectors
(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b))
                 (+ (upper-bound a) (upper-bound b))))

(define (mul-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (make-interval 
      (min (* a c) (* a d) (* b c) (* b d))
      (max (* a c) (* a d) (* b c) (* b d)))))

(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

(define (print-interval interval)
  (display "[")
  (display (lower-bound interval))
  (display ", ")
  (display (upper-bound interval))
  (display "]")
  (newline))

; 2.7
(define (make-interval lower-bound upper-bound)
  (cons lower-bound upper-bound))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define test-interval (make-interval -2 10))

(assert-eq (lower-bound test-interval) -2)
(assert-eq (upper-bound test-interval) 10)

; 2.8

(define (sub-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (make-interval (min (- a c) (- a d))
                   (max (- b c) (- b d)))))

(define one-to-five (make-interval 1 5))
(define neg-two-to-seven (make-interval -2 7))
(define neg-nine-to-neg-three (make-interval -9 -3))

(assert-eq (lower-bound (sub-interval one-to-five neg-two-to-seven)) -6)
(assert-eq (upper-bound (sub-interval one-to-five neg-two-to-seven)) 7)


; 2.9
(define (width interval)
  (/ (abs (- (upper-bound interval) (lower-bound interval))) 2))

(disp (width one-to-five))
(disp (width neg-nine-to-neg-three))

(define (width-of-sum a b)
  (+ (width a) (width b)))

(define (width-of-difference a b)
  (width-of-sum a b))

(assert-eq (width-of-difference neg-nine-to-neg-three one-to-five) 5)
(assert-eq (width (sub-interval neg-nine-to-neg-three one-to-five)) 5)

; counterexamples for mult and division

(define two-to-three (make-interval 2 3))
(print-interval (mul-interval two-to-three two-to-three))
; width is 5, no relationship to original width of 0.5
(print-interval (div-interval two-to-three two-to-three))
; same for division - it's 5/6, no relationship to original width or 0.5


; 2.10
; done

(define (div-interval a b)
  (define (contains-zero? interval)
    (and (positive? (upper-bound interval)) (negative? (lower-bound interval))))
  (if (contains-zero? b)
    (error "Cannot divide by 0 - undefined")
    (mul-interval
      a
      (make-interval (/ 1.0 (upper-bound b)) (/ 1.0 (lower-bound b))))))


; redo on paper
; 2.11
(define (mul-interval a b)
  (let ((l_a (lower-bound a))
        (u_a (upper-bound a))
        (l_b (lower-bound b))
        (u_b (upper-bound b)))
    (cond (
           ((and (positive? l_a) (positive? u_a) (positive? l_b) (positive? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (negative? l_a) (positive? u_a) (positive? l_b) (positive? u_b))
            (make-interval (* l_a u_b) (* u_a u_b)))
           ((and (positive? l_a) (negative? u_a) (positive? l_b) (positive? u_b))
            (make-interval (* u_a u_b) (* l_a u_b)))
           ((and (positive? l_a) (positive? u_a) (negative? l_b) (positive? u_b))
            (make-interval (* u_a l_b) (* u_a u_b)))
           ((and (positive? l_a) (positive? u_a) (positive? l_b) (negative? u_b))
            (make-interval (* u_a u_b) (* u_a l_b)))
           ((and (negative? l_a) (negative? u_a) (positive? l_b) (positive? u_b))
            (make-interval (* l_a u_b) (* u_a l_b)))
           ((and (negative? l_a) (positive? u_a) (negative? l_b) (positive? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (negative? l_a) (positive? u_a) (positive? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (positive? l_a) (negative? u_a) (negative? l_b) (positive? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (positive? l_a) (negative? u_a) (positive? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (positive? l_a) (positive? u_a) (negative? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (negative? l_a) (negative? u_a) (negative? l_b) (positive? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (negative? l_a) (negative? u_a) (positive? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (negative? l_a) (positive? u_a) (negative? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* u_a u_b)))
           ((and (positive? l_a) (negative? u_a) (negative? l_b) (negative? u_b))
            (make-interval (* l_a l_b) (* l_a l_b)))
           ((and (negative? l_a) (negative? u_a) (negative? l_b) (negative? u_b))
            (make-interval (* u_a u_b) (* l_a l_b)))))))




; more constructors and getters
(define (make-interval-cw center width)
  (make-interval (- center width) (+ center width)))

(define (center interval)
  (average (lower-bound interval) (upper-bound interval)))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define test-interval (make-interval-cw 3.0 1.5))
(assert-close (center test-interval) 3.0)
(assert-close (width test-interval) 1.5)

; done - make sure to internalize this idea of changing internal representation without changing external api
; 2.12
(define (make-center-percent center percent)
  (make-interval-cw center (* percent center)))

(define (percent interval)
  (/ (- (center interval) (lower-bound interval)) (center interval)))

(define test-percent-interval (make-center-percent 3.0 .2))
(assert-close (center test-percent-interval) 3.0)
(assert-close (percent test-percent-interval) .2)

; write it down on paper, but I think it's the centers times each other then times the sum of the percentages
; 2.13
; (* lower_a lower_b) = (* (- center (* percent center)) 
; let c1 be the center of interval 1 and c2 be the center of interval 2
; and p1 be the percentage uncertainty for interval 1, and p2 in the same vein,
; then, assuming positive intervals, the center of a *b is c1 * c2, and the lower-bound of a * b is
; (1 - p1)*c1 * (1 - p2)*c2 = (1 - p1 - p2 + p1*p2)*c1*c2. Now, at small percentage tolerances, p1*p2 ; is extremely small and can be effectively ignored. meaning our lower bound would be (1-p1-p2)*c1*c2
;. A similar analysis holds for the upper bounds. This means that the percentage tolerance is the sume; of the two percentage tolerances.
(define (approx-percent-mul a b)
  (+ (percent a) (percent b)))

(define test-interval-1 (make-center-percent 3.0 .001))
(define test-interval-2 (make-center-percent 1.0 .003))

(assert-close (percent (mul-interval test-interval-1 test-interval-2))
              (approx-percent-mul test-interval-1 test-interval-2))

;2.14
; Let A = [2, 5], then A/A = [.4, 2.5], when it clearly should be [1, 1]. See explanation below.

;2.15
; Agreed. See my explanation in 2.16 for a full treatment. Basically, If interval A appears multiple times in an equation, our package makes the mistake in allowing A to vary across its interval EACH time it appears in the equation, when in reality it should be pegged across the equation. 
; example: A/A should always be 1, yet if A = [-3, 1] our package says A/A is [-3, 1].

;2.16
;In general, the problem is that if you use the same interval multiple times in an equation, our interval package allows the interval's value to vary in each of those instances. But in reality, the value of that interval is the same throughout the equation. A good illustration is A/A. This should ALWAYS be 1, no matter what the interval is, and yet our package allows A to take on a different value when it is the numerator vs when it is the denomenator.

; At first I thought you could solve this simply by pegging each interval's value to the lower or upper-bound throughout the equation and then solving. Unfortunately, when you have the same interval multiple times in the equation, you aren't guaranteed that you can determine the new interval with the lower or upper bound of the input interval. It could be somewhere IN BETWEEN those values.
; For example, take f(A) = A*A, where A is interval [-1,1]. What is the lower bound of A*A? Well, if you set A = -1 or A = 1, you get A*A = 1, which would suggest the interval A*A = [1, 1]. This is clearly wrong, however, because if we let A = 0, then A*A = 0, a new lower bound. 
; Since A might need to take any value in between its lower and upper value, I don't see a way to solve this. Some type of gradient descent on A would work for some equations, but it would suffer the same limitations as gradient descent normally.
; It seems this problem just boils down to finding the global minimum and maximum of an equation, which does not have a definite closed form solution for all equations.



