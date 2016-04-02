(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

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

(disp (e-2))
