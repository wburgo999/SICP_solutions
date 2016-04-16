;; 2.60
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

;; What is the time complexity of the unique version in 2.59?
;;    element-of-set?  -  O(n)
;;    adjoin-set       -  O(n)
;;    union-set       -  O(n^2) assuming each set is of size n, because adjoin is called n times
;;    intersection-set - O(n^2) because element-of-set? is called n times
;;
;; What is the time complexity for this duplicate version?
;;    element-of-set?  -  O(n) 
;;    adjoin-set       -  O(1)
;;    union-set        -  O(n) - append is O(n)
;;    intersection-set - O(n^2) same as before
;;
;; Note, the time complexity for union and adjoin-set are both lower. The disadvantage is that the sets grow arbitrary large if you don't deduplicate them. This would be very useful for some type of real time application where time is critical and you're doing a lot of adjoins and unions on the fly. You could then later dedupe them if you have downtime. This is similar to the idea of some databases being really fast for reads vs writes. It all depends on your use case and when speed is most important. 

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (make-set . elements)
  elements)

(define adjoin-set cons)
(define union-set append)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

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
