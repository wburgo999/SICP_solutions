(load "./1.6.scm")

;; (define epsilon 0.001)
;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) epsilon))

(print "Defining the good-enough? test used in computing square roots as above will not be
effective with small numbers---in particular, real numbers in (0,epsilon), where
epsilon is the small number used in good-enough? to assess the quality of `guess'.
\n
When terminating the sqrt-iter algorithm based on the absolute difference between the
square of `guess' and `x' we observe: 
\n
\t As `x' approaches the neighborhood of epsilon, the
solution decreases in quality in terms of precision (in fact, becomes highly inaccurate),
for example,
\n
x                           = 0.008
guess                       = 0.0900198385515017
(square guess)              = 0.00810357133283843
difference                  = 0.000103571332838431
\n
where epsilon is 0.001 and difference = (abs (- (square guess) x)). The solution will be
as accurate as the magnitude of epsilon. When `x' is close to epsilon, then the accuracy
suffers because the error magnitude relative to `x' will be large. 
\n
\t When `x' is smaller than epsilon, then the algorithm will fail completely
(not only in precision, but will produce wrong values) because it will terminate
as soon as the square of `guess' is smaller than epsilon--and in a loose sense--irrespective of
the value of `x' (especially if the magnitude of `x' proportional to epsilon is very small),
for example,
\n
x                           = 1e-07
guess                       = 0.0312510656177538
(square guess)              = 0.000976629102245155
difference                  = 0.000976529102245155
\n
notice that the difference is exactly the same as the square of `guess'. Similarly, for another
small value of x,
\n
x                           = 1e-10
guess                       = 0.031250001065625
(square guess)              = 0.000976562566601563
difference                  = 0.000976562466601563
\n
notice that `guess' for the latter two values of `x' are very close (the same to the 5th decimal point).\n")

;; WIP

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))


;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x)))



(define init_guess 1.0)
(define small_num 0.01)

(define test (sqrt-iter init_guess small_num))


(print "\n" small_num)
(print test)
(print (square test))
(print (- (square test) small_num))

(print (sqrt-iter 1.0 0.00006))
