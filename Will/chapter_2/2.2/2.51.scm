(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(load "2.48.scm")

(define (below painter-1 painter-2)
  (let
    ((painter-top
       (transform-painter 
         painter-2
         (make-vect 0 0)
         (make-vect 1 0)
         (make-vect 0 0.5)))
     (painter-bottom
       (transform-painter
         painter-1
         (make-vect 0 0.5)
         (make-vect 1 0.5)
         (make-vect 0 1))))
    (lambda (frame)
      (painter-bottom frame)
      (painter-top frame))))

(define (below painter-1 painter-2)
  (let
    ((painter-left (rotate-270 painter-1))
     (painter-right (rotate-270 painter-2)))
    (lambda (frame)
      (rotate-90 (beside painter-left painter-right)))))
