; Why is sinx ~= x at small x? Because (derivative sin) is cos, which at 0 is 1
; How many times will it be called? Will be called (log3 n) times
; Time complexity? Time complexity (log n), space complexity is (log n) as well, because it is NOT tail recursive
; TODO: think of another example of this phenomenon

(load "../utils.scm")
(load "../test-lib.scm")

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

(disp (sine 12.5))


