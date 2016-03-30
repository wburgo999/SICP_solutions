(load "../utils.scm")
(load "../test-lib.scm")

(define (integral a b f n)
  (define (term y)
    (cond (or (= n 0) (= n b) f a))
          ((= y b) (f b))
          (())))
  (define (next y)
    (+ y (/ (- b a) n)))
  (sum a b term next))