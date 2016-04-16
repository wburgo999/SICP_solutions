;; 2.61, 2.62
;; should find way to test that they're ordered
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
       '()
       (let ((x1 (car set1))
             (x2 (car set2)))
         (cond ((= x1 x2) 
                (cons x1 (intersection-set (cdr set1) (cdr set2))))
               ((< x1 x2)
                (intersection-set (cdr set1) set2))
               ((> x1 x2)
                (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (if (or (null? set) (> x (car set)))
    (cons x set)
    (cons (car set) (adjoin-set x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else 
          (let ((x1 (car set1))
                (x2 (car set2)))
            (cond ((equal? x1 x2)
                   (cons x1 (union-set (cdr set1) (cdr set2))))
                  ((< x1 x2)
                   (cons x1 (union-set (cdr set1) set2)))
                  ((> x1 x2)
                   (cons x2 (union-set set1 (cdr set2)))))))))


(define test-set-1 (list 1 3 4))
(define test-set-2 (list 2 3 4 6))

(assert-true (element-of-set? 1 test-set-1))
(assert-true (element-of-set? 3 test-set-1))
(assert-false (element-of-set? 5 test-set-1))

(define test-intersection (intersection-set test-set-1 test-set-2))
(assert-true (element-of-set? 3 test-intersection))
(assert-false (element-of-set? 6 test-intersection))

(define test-union (union-set test-set-1 test-set-2))
(assert-true (element-of-set? 6 test-union))
(assert-false (element-of-set? 7 test-union))

