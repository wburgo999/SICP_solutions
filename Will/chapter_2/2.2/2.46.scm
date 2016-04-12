(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define add-vect
  (lambda (u v)
    (make-vect (+ (xcor-vect u) (xcor-vect v))
               (+ (ycor-vect u) (ycor-vect v)))))

(define sub-vect
  (lambda (u v)
    (let ((neg-v (make-vect (- (xcor-vect v)) (- (ycor-vect v)))))
      (add-vect u neg-v))))

(define scale-vect
  (lambda (alpha v)
    (make-vect (* alpha (xcor-vect v))
               (* alpha (ycor-vect v)))))

(define u (make-vect 1 2))
(define v (make-vect 3 4))

(assert-eq (xcor-vect u) 1)
(assert-eq (ycor-vect u) 2)

(assert-eq (xcor-vect (add-vect u v)) 4)
(assert-eq (ycor-vect (add-vect u v)) 6)

(assert-eq (xcor-vect (sub-vect u v)) -2)
(assert-eq (ycor-vect (sub-vect u v)) -2)

(assert-eq (xcor-vect (scale-vect 4 u)) 4)
(assert-eq (ycor-vect (scale-vect 4 u)) 8)


