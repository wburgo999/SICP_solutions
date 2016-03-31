; done, but in repl, write out in full here
(load "../utils.scm")
(load "../test-lib.scm")

(define count 0)

(define (count-change amount)
  (set! count 0)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (set! count (+ count 1))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(for-each (lambda (x)
            (disp "num ways: " (count-change x))
            (disp "Count: " count))
          '(100 200 300 400))
