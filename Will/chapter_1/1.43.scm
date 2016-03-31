(load "../utils.scm")
(load "../test-lib.scm")

(define (repeated f n)
  (define (iter count result)
    (if (= count n)
      result
      (iter (inc count) (compose f result))))
  (iter 1 f))

