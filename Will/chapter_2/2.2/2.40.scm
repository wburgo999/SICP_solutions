(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (cons i j))
                  (enumerate 1 i)))
             (enumerate 1 n)))

(assert-eq (unique-pairs 3)
           (list (cons 1 1) (cons 2 1) (cons 2 2) (cons 3 1) (cons 3 2) (cons 3 3)))

(define (prime-sum n)
  (filter (lambda (x)
            (prime? (caddr x)))
          (map (lambda (pair)
                 (list (car pair) (cdr pair) (+ (car pair) (cdr pair))))
               (unique-pairs n))))

(assert-eq (prime-sum 3) (list (list 1 1 2) (list 2 1 3) (list 3 2 5)))

