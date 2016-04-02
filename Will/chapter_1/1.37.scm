(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (cont-frac n d k)
  (define (iter index result)
    (if (< index 1)
      result
      (iter (dec index) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(define (cont-frac-recursive n d k counter)
  (if (= counter k)
    (/ (n counter) (d counter))
    (/ (n counter) (+ (d counter) (cont-frac-recursive n d k (inc counter))))))

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))
(disp (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 30))
(disp (cont-frac-recursive (lambda (i) 1.0) (lambda (i) 1.0) 10 1))




(disp "1/ golden-ratio: " (/ 1 golden-ratio))


