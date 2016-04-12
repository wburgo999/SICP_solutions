; done: redo, it's good and mind bending
; do some of my own
; purpose: accumulate is a primitive the rest can be written in terms of. 
; Accumulate can build something up (by using cons), or reduce a list to a value
; if takes two arguments (x y) where x is (car sequence) and y is the remaining
; so you get (f e1 (f e2 (f e3 (f e4 (f '()))))) where (f '()) => initial
; notice how accumulate is like 
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (my-map p sequence)
  (accumulate
    (lambda (x y)
      (cons (p x) y))
    '()
    sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate (lambda (a b) (+ b 1)) 0 sequence))


; TESTS
(define test-sequence (enumerate 1 5))

(assert-eq (my-map square test-sequence) (map square test-sequence))
(assert-eq (my-append test-sequence test-sequence) (append test-sequence test-sequence))
(assert-eq (my-length test-sequence) (length test-sequence))




