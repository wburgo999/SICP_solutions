(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define (cc amount coin-values)
  (define no-more? null?)
  (define first-denomination car)
  (define except-first-denomination cdr)
  (cond ((< amount 0) 0)
        ((= amount 0) 1)
        ((no-more? coin-values) 0)
        (else (+ (cc (- amount (first-denomination coin-values)) coin-values)
                 (cc amount (except-first-denomination coin-values))))))

(define us-coins (list 50 25 10 5 1))

(assert-eq (cc 100 us-coins) 292)

