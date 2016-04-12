(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define a (list 1 3 (list 5 7) 9))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

; answers with plain cars and cdrs
(assert-eq (car (cdr (car (cdr (cdr a))))) 7)
(assert-eq (car (car b)) 7)
(assert-eq (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))) 7)

; using the caaddddaaaddr stuff
(assert-eq (cadr (caddr a)) 7)
(assert-eq (caar b) 7)
(assert-eq (cadr (cadr (cadr (cadr (cadr (cadr c)))))) 7) ;makes the idea of cadr explicit
; OR
(assert-eq (cadadr (cadadr (cadadr c))) 7)

