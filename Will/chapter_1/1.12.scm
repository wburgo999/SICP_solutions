(load "../utils.scm")
(load "../test-lib.scm")

(define (pascal n)
  (define (pascal r c)
    (cond ((eq? r 0) 0)
          ((eq? c 0) 0)
          ((> c r) 0)
          ((eq? r 1) 1)
          (else (+
                  (pascal (- r 1) c)
                  (pascal (- r 1) (- c 1))))))
  (define (pascal-iter r c)
    (display (pascal r c))
    (display " ")
    (if (not (and (= r c) (= r n)))
      (cond ((= r c) (begin
                       (display "\n")
                       (pascal-iter (+ r 1) 1)))
            (else (pascal-iter r (+ c 1))))))
  (pascal-iter 1 1))

(pascal 10)



