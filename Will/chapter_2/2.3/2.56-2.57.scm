;; 2.56, 2.57
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (deriv expression variable)
  (cond ((sum? expression)
         (make-sum (deriv (addend expression) variable)
                   (deriv (augend expression) variable)))
        ((product? expression)
         (make-sum 
           (make-product (deriv (multiplier expression) variable)
                         (multiplicand expression))
           (make-product (multiplier expression)
                         (deriv (multiplicand expression) variable))))
        ((exponentiation? expression)
         (make-product
           (exponent expression)
           (make-product
             (make-exponentiation
               (base expression)
               (make-sum (exponent expression) (- 1)))
             (deriv (base expression) variable))))
        ((variable? expression)
         (if (eq? expression variable) 1 0))
        ((number? expression) 0)
        (else (error "Invalid expression"))))

(define (=number? expression x)
  (and (number? expression) (= expression x)))

(define variable? symbol?)

(define (make-sum addend augend)
  (cond ((and (number? addend) (number? augend)) (+ addend augend))
        ((=number? addend 0) augend)
        ((=number? augend 0) addend)
        (else (list '+ addend augend))))
(define (addend sum) (cadr sum))
(define (augend sum) (caddr sum))

(define (sum? sum)
  (and (pair? sum) (eq? (car sum) '+)))

(define (make-product multiplier multiplicand)
  (cond ((or (=number? multiplier 0) (=number? multiplicand 0)) 0)
        ((and (number? multiplier) (number? multiplicand)) (* multiplier multiplicand))
        ((=number? multiplier 1) multiplicand)
        ((=number? multiplicand 1) multiplier)
        (else (list '* multiplier multiplicand))))

(define (multiplier product) (cadr product))
(define (multiplicand product) (caddr product))

(define (product? product)
  (and (pair? product) (eq? (car product) '*)))

(define (exponentiation? expression)
  (and (pair? expression) (eq? (car expression) '**)))

(define base cadr)

(define exponent caddr)

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((=number? base 1) 1)
        ((=number? base 0)
         (if (and (number? exponent) (positive? exponent))
           0
           (error "Can't divide by zero -- raise zero to negative number")))
        (else (list '** base exponent))))


(assert-eq (deriv '(* x y) 'x) 'y)

(assert-eq (deriv '(** x 3) 'x) '(* 3 (** x 2)))

(assert-eq (deriv '(** x 1) 'x) '1)

(assert-eq (deriv '(** x 2) 'x) '(* 2 x))


;; 2.57

(define (make-sum a . rest)
  (cond ((and (pair? rest) (null? (cdr rest)))
        (cond ((and (number? a) (number? (car rest))) (+ a (car rest)))
              ((=number? a 0) (car rest))
              ((=number? (car rest) 0) a)))
        (else (cond ((pair? a) (list '+ a))
                    ((null? rest) a)
                    ((pair? (car rest)) (list '+ (cons a (car rest))))
                    (else (list '+ (cons a rest)))))))

(define (addend sum)
  (cond ((not (pair? (cadr sum))) (cadr sum))
        (else (caadr sum))))

(define (augend sum)
  (cond ((not (pair? (cadr sum))) (make-sum (cddr sum)))
        ((pair? (cadr sum))
         (if (null? (cdadr sum))
           0
           (make-sum (cdadr sum))))))

(assert-eq (deriv '(+ x x x 3 4 x x x x x) 'x) 8)

(define (make-product a . rest)
  (cond ((and (pair? rest) (null? (cdr rest)))
        (cond ((and (number? a) (number? (car rest))) (* a (car rest)))
              ((or (=number? a 0) (=number? (car rest) 0)) 0)
              ((=number? a 1) (car rest))
              ((=number? (car rest) 1) a)))
        (else (cond ((pair? a) (list '* a))
                    ((null? rest) a)
                    ((pair? (car rest)) (list '* (cons a (car rest))))
                    (else (list '* (cons a rest)))))))

(define (multiplier product)
  (cond ((not (pair? (cadr product))) (cadr product))
        (else (caadr product))))

(define (multiplicand product)
  (cond ((not (pair? (cadr product))) (make-product (cddr product)))
        ((pair? (cadr product))
         (if (null? (cdadr product))
           1
           (make-product (cdadr product))))))

(assert-eq (deriv '(* x 2 3 4 5) 'x) 1)






