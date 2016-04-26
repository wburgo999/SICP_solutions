;; probability library
(use random-bsd)
(use vector-lib)


(define (gen-uniform-reals-vector bound size)
  ;; generate a uniformly distributed real vector in the range [-bound, bound]
  (vector-map (lambda (x y) (+ (- (random bound) (random bound)) (random-real)) ) (make-vector size)))
