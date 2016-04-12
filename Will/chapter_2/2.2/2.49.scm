(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(load "2.48.scm")

(define segment-list
  (list (make-segment (make-vect 0 0) (make-vect 1 0))
        (make-segment (make-vect 1 0) (make-vect 1 1))
        (make-segment (make-vect 1 1) (make-vect 0 1))
        (make-segment (make-vect 0 1) (make-vect 0 0))))

(define outline-painter (segments->painter segment-list))

(define segment-list
  (list (make-segment (make-vect 0 1) (make-vect 1 0))
        (make-segment (make-vect 0 0) (make-vect 1 1))))

(define x-painter (segments->painter segment-list))

(define segment-list
  (list (make-segment (make-vect 0.5 0) (make-vect 0.5 1))
        (make-segment (make-vect 0 0.5) (make-vect 1 0.5))))

(define diamond-painter (segments->painter segment-list))

;; blargh, I don't wanna draw the wave painter!!!
