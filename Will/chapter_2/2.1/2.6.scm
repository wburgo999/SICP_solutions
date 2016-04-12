; still don't understand
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define zero (lambda (f) identity))
(define one (lambda (f) (f identity)))
(define two (lambda (f) (f (f identity))))
(define three (lambda (f) (f (f (f identity)))))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

