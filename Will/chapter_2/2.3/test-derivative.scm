; 2.56, 2.57, 2.58
; purpose: to show how symbols work and data abstraction. You can change the underlying way 
; the data is represented, to increase generality, without affecting the data abstraction layers 
; above it
(load "derivative.scm")
(load "../../helpers/test-lib.scm")

(define test-sum1 (make-sum 1 2))
(assert-eq test-sum1 3)
(define test-sum (make-sum 3 'a))
(assert-eq test-sum (list '+ 3 'a))
(assert-eq (addend test-sum) 3)
(assert-eq (augend test-sum) 'a)
(assert-eq (sum? test-sum) #t)
(assert-eq (sum? 1) #f)
(assert-eq (sum? (list 1 2 3)) #f)
(assert-eq (sum? (list 1 '+ 3)) #f)


(define test-product (make-product 3 'a))
(define test-product1 (make-product 3 4))
(assert-eq test-product1 12)
(assert-eq test-product (list '* 3 'a))
(assert-eq (multiplier test-product) 3)
(assert-eq (multiplicand test-product) 'a)
(assert-eq (product? test-product) #t)
(assert-eq (product? 1) #f)
(assert-eq (product? (list 1 2 3)) #f)
(assert-eq (product? (list 1 '* 3)) #f)

(assert-eq (variable? 'x) #t)
(assert-eq (variable? "x") #f)
(assert-eq (variable? 3) #f)
(assert-eq (variable? (list 'a 'b)) #f)
(assert-eq (variable? '(a b)) #f)

(assert-eq (=number? 1 2) #f)
(assert-eq (=number? 1 1) #t)
(assert-eq (=number? (list 1 2) 2) #f)
(assert-eq (=number? '1 '1) #t)


(define test-expression (make-sum 'x 
                                  (make-product
                                    'x 3)))
(define test-expression2 (list '* 'x 'x))
(define test-expression3 (list '* 'x (list '* 'x 'x)))
(assert-eq (deriv test-expression 'x) 4)
(disp (deriv test-expression2 'x))
(disp (deriv test-expression3 'x))
(disp (deriv '(* (* x y) (+ x 3)) 'x))


(define test-expression4 (list '** 'x 4))
(disp (deriv test-expression4 'x))
