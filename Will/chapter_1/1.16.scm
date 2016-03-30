; TODO: think of other examples of this algorithm
; maintaining an 'invariant' such that you always have the full 'answer' described by the arguments is a way to do iterative
; otherwise, you'd have to do a recursive process, because you'd multiply by b for all the odds
; STEPS? (log2 n) steps, but since it's tail recursive, space is O(1)

(load "utils.scm")
(load "test-lib.scm")

(define (fast-expt b n a)
  (cond ((eq? n 1) a)
        ((odd? n) (fast-expt b (/ (- n 1) 2) (* (* a b) (square b))))
        (else (fast-expt b (/ n 2) (* a (square b))))))

(define (main b n)
  (fast-expt b n 1))

(disp (main 3 4))


(define (mult-recursive a b)
  (if (eq? a 0)
    0
    (+ b (mult-recursive (- a 1) b))))

(define (mult-iter a b)
  (define (mult a b total)
    (if (eq? a 0)
      total
      (mult (- a 1) b (+ total b))))
  (mult a b 0))

(disp "mult 3 4: " (mult-recursive 3 4))
(disp "mult-ter 3 4: " (mult-iter 3 4))

