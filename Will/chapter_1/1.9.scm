(load "../utils.scm")
(load "../test-lib.scm")

(define (fact-recursive n)
  (if (= n 0)
    1
    (* n (fact-recursive (- n 1)))))

(define (fact-iter n)
  (define (fact total counter)
    (if (eq? counter 0)
      total
      (fact (* total counter) (- counter 1))))
  (fact 1 n))

(assert-eq (fact-recursive 5) 120)
(assert-eq (fact-iter 5) 120)


(define (fib-recursive n)
  (if (or (eq? n 1) (eq? n 2))
    1
    (+ (fib-recursive (- n 1))
       (fib-recursive (- n 2)))))

(define (fib-iter n)
  (define (fib current prev counter)
    (if (eq? counter 1)
      current
      (fib (+ current prev) current (- counter 1))))
  (fib 1 0 n))

(assert-eq (fib-recursive 10) 55)
(assert-eq (fib-iter 10) 55)

(define (mult-iter a b)
  (define (mult sum add-term counter)
    (if (eq? counter 0)
      sum
      (mult (+ sum add-term) add-term (- counter 1))))
  (mult 0 b a))

(define (mult-recursive a b)
  (define (mult a b)
    (if (eq? a 1)
      b
      (+ b (mult (- a 1) b ))))
  (mult a b ))

(assert-eq (mult-recursive 10 5) 50)
(assert-eq (mult-iter 10 5) 50)

(define (add-recursive a b)
    (define (add a b)
      (if (eq? a 0)
        b
        (+ 1 (add (- a 1) b))))
    (add a b))

(define (add-iter a b)
  (define (add sum counter)
    (if (eq? counter 0)
      sum
      (add (+ sum 1) (- counter 1))))
  (add b a))

(assert-eq (add-recursive 10 5) 15)
(assert-eq (add-iter 10 5) 15)





