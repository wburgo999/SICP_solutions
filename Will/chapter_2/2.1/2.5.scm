(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
; reasoning - since prime factorizations are unique, then take any pair (a b) and (c d).
; suppose (* (expt 2 a) (expt 3 b)) and (* (expt 2 c) (expt 3 d)) are the same,
; then their prime factorizations are the same (since both 2 and 3 are prime), meaning there are the
; same number os 2s and 3s, meaning that (= a c) and (= b c)

(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (my-car pair)
  (define (iter pair result)
    (if (not (= (remainder pair 2) 0))
      result
      (iter (/ pair 2) (inc result))))
  (iter pair 0))

(define (my-cdr pair)
  (define (iter pair result)
    (if (not (= (remainder pair 3) 0))
      result
      (iter (/ pair 3) (inc result))))
  (iter pair 0))


(define test-pair (my-cons 4 7))

(assert-eq (my-car test-pair) 4)
(assert-eq (my-cdr test-pair) 7)
(assert-eq test-pair 34992)
