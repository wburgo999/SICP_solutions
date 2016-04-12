(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (rect upper-left lower-right)
  (let ((len (- (x-point lower-right) (x-point upper-left)))
        (width (- (y-point upper-left) (y-point lower-right))))
    (rect-other upper-left len width)))

(define (rect-other upper-left len width)
  (cons upper-left (cons len width)))

(define (len rect)
  (cadr rect))

(define (width rect)
  (cddr rect))

(define (perimeter rect)
  (let ((w (width rect))
        (l (len rect)))
    (+ w w l l)))

(define (area rect)
  (* (width rect) (len rect)))

(define test-rect-1 (rect-other (make-point 1 5) 2 3))
(define test-rect-2 (rect (make-point 1 5)
                          (make-point 3 2)))

(assert-eq (len test-rect-1) 2)
(assert-eq (len test-rect-2) 2)
(assert-eq (width test-rect-1) 3)
(assert-eq (width test-rect-2) 3)

(assert-eq (perimeter test-rect-1) 10)
(assert-eq (area test-rect-1) 6)
(assert-eq (perimeter test-rect-2) 10)
(assert-eq (area test-rect-2) 6)
