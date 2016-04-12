; done
; purpose: show you how to operate on nested lists/ tree like structures
;   It's always recursion, and you always have to check the two base cases:
;   (1) null and (2) not a pair

(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (deep-reverse items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? (car items))
           (iter (cdr items) (cons (deep-reverse (car items)) result)))
          (else (iter (cdr items) (cons (car items) result)))))
  (iter items '()))


(define nums (list 1 2 3 (list 4 5 6) 7 8 9))
(disp (deep-reverse nums))

; Is there a way to do this with an iterative procedure?
