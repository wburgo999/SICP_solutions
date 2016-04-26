(load "./lib/math.scm")
(load "./lib/prob.scm")


(define A  (gen-uniform-reals-vector 1000 2))

(print (square (vector-ref A 0)))
