(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

; part a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

(define sub-branch-1 (make-branch 1 2))
(define sub-branch-2 (make-branch 2 4))
(define sub-branch-3 (make-branch 3 6))
(define sub-branch-4 (make-branch 4 8))

(define sub-mobile-1 (make-mobile sub-branch-1 sub-branch-2))
(define sub-mobile-2 (make-mobile sub-branch-3 sub-branch-4))

(define branch-1 (make-branch 5 sub-mobile-1))
(define branch-2 (make-branch 6 sub-mobile-2))

(define mobile-1 (make-mobile branch-1 branch-2))

(assert-eq (left-branch mobile-1) branch-1)
(assert-eq (right-branch mobile-1) branch-2)
(assert-eq (branch-length sub-branch-1) 1)
(assert-eq (branch-structure sub-branch-1) 2)
(assert-eq (branch-length branch-1) 5)
(assert-eq (branch-structure branch-1) sub-mobile-1)

; part b
(define is-mobile?
  (lambda (structure) (pair? (left-branch structure))))
(define is-leaf-branch?
  (lambda (structure) (not (pair? (branch-structure structure)))))

(define (total-weight structure)
  (cond ((is-mobile? structure)
         (+ (total-weight (left-branch structure))
            (total-weight (right-branch structure))))
        ((is-leaf-branch? structure) (branch-structure structure))
        (else (total-weight (branch-structure structure)))))

(assert-eq (total-weight sub-branch-1) 2)
(assert-eq (total-weight sub-mobile-1) 6)
(assert-eq (total-weight branch-1) 6)
(assert-eq (total-weight mobile-1) 20)

; part c
(define (torque branch)
  (* (branch-length branch)
     (total-weight branch)))

(assert-eq (torque branch-1) 30)
(assert-eq (torque branch-2) 84)

(define (balanced structure)
  (cond ((or (null? structure) (is-leaf-branch? structure)) #t)
        ((is-mobile? structure)
         (and (= (torque (left-branch structure))
                 (torque (right-branch structure)))
              (balanced (left-branch structure))
              (balanced (right-branch structure))))
        (else (balanced (branch-structure structure)))))

(define balanced-sub-mobile (make-mobile sub-branch-1 sub-branch-1))
(define balanced-branch (make-branch 5 balanced-sub-mobile)) 
(define balanced-mobile (make-mobile balanced-branch balanced-branch))

(assert-eq (balanced mobile-1) #f)
(assert-eq (balanced balanced-sub-mobile) #t)
(assert-eq (balanced balanced-mobile) #t)

; part d, I don't have to change it almost at all! In fact, I just need to change
; the right-branch and branch-structure selectors. This is the power of data abstraction!
; Use selectors and you can represent the underlying data any way you want
(define (make-mobile left right)
  (cons left right))
(define (make-branch len structure)
  (cons len structure))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

(define sub-branch-1 (make-branch 1 2))
(define sub-branch-2 (make-branch 2 4))
(define sub-branch-3 (make-branch 3 6))
(define sub-branch-4 (make-branch 4 8))
(define sub-mobile-1 (make-mobile sub-branch-1 sub-branch-2))
(define sub-mobile-2 (make-mobile sub-branch-3 sub-branch-4))
(define branch-1 (make-branch 5 sub-mobile-1))
(define branch-2 (make-branch 6 sub-mobile-2))
(define mobile-1 (make-mobile branch-1 branch-2))
(define balanced-sub-mobile (make-mobile sub-branch-1 sub-branch-1))
(define balanced-branch (make-branch 5 balanced-sub-mobile)) 
(define balanced-mobile (make-mobile balanced-branch balanced-branch))

(assert-eq (left-branch mobile-1) branch-1)
(assert-eq (right-branch mobile-1) branch-2)
(assert-eq (branch-length sub-branch-1) 1)
(assert-eq (branch-structure sub-branch-1) 2)
(assert-eq (branch-length branch-1) 5)
(assert-eq (branch-structure branch-1) sub-mobile-1)
(assert-eq (total-weight sub-branch-1) 2)
(assert-eq (total-weight sub-mobile-1) 6)
(assert-eq (total-weight branch-1) 6)
(assert-eq (total-weight mobile-1) 20)
(assert-eq (torque branch-1) 30)
(assert-eq (torque branch-2) 84)
(assert-eq (balanced mobile-1) #f)
(assert-eq (balanced balanced-sub-mobile) #t)
(assert-eq (balanced balanced-mobile) #t)
