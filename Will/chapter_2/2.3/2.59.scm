;; set lib
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (make-set . elements)
  (define (iter elements result)
    (if (null? elements)
      result
      (iter (cdr elements) (adjoin-set (car elements) result))))
  (iter elements '()))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (if (null? set1)
    set2
    (union-set (cdr set1) (adjoin-set (car set1) set2))))

(define test-set '())
(assert-false (element-of-set? 1 test-set))
(assert-true (element-of-set? 1 (adjoin-set 1 test-set)))

(define test-set-1 (make-set 1 2 3 4 3 2))
(assert-true (element-of-set? 1 test-set-1))
(assert-true (element-of-set? 3 test-set-1))
(assert-false (element-of-set? 5 test-set-1))

(define test-set-2 (make-set 3 4 5))

(define test-intersection (intersection-set test-set-1 test-set-2))
(assert-true (element-of-set? 3 test-intersection))
(assert-false (element-of-set? 5 test-intersection))

(define test-union (union-set test-set-1 test-set-2))
(assert-true (element-of-set? 5 test-union))
