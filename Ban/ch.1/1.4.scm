;; requires random-bsd, vector-lib

;; Describe behavior of:
;;          (define (a-plus-abs-b a b) ((if (> b 0) + -) a b))
;; based on the observation that the evaluation model allows for operators of combinations to be compound expressions.

(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))


;; generate random numbers between 0 and 1000
(use random-bsd)
(use vector-lib)

;; randomly generate a real vector of size 2 between -1000 and 1000
(define randomRealsVector (vector-map (lambda (x y) (+ (- (random 1000) (random 1000)) (random-real)) ) (make-vector 2)))

;; print output of function in question
(print "a =\t"
       (vector-ref randomRealsVector 0)
       "\nb =\t"
       (vector-ref randomRealsVector 1)
       "\n")

(print "(a-plus-abs-b  "
       (vector-ref randomRealsVector 0)
       "\t"
       (vector-ref randomRealsVector 1)
	")"
       "\n")

(print "ans = "(a-plus-abs-b
	(vector-ref randomRealsVector 0)
	(vector-ref randomRealsVector 1)))

(print "\n First, we note that the leftmost subexpression, \n"
       "the operator, is a compound expression that needs \n"
       "to be evaluated. \n"
       "The evaluation procedure needs to first evaluate(apply the \n"
       "evaluation procedure to) the subexpression corresponding \n"
       "to the operator in order to obtain the procedure to \n"
       "be applied to the operands in the given combination.\n\n"
       "evaluate ((if (> b 0) + -)), where b = \n"
       (vector-ref randomRealsVector 1) "\n\n"
       
       (if (> (vector-ref randomRealsVector 1) 0) + -)
       "\n\n"
       "Notice that the output of the above evaluation is a procedure, \n"
       "which will then be used to evaluate the combination \n"
       "at hand by applying the resulting procedure to the \n"
       "operands 'a' and 'b' that are primitives (real numbers). \n\n")
       





