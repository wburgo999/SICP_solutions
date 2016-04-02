; done - but I don't know why this pattern exists
(load "../utils.scm")
(load "../test-lib.scm")

; In order to test this better, let's make function that returns
; the fixed point function for the nth root

(define (nth-root-fixed-point-proc root n)
  (lambda (guess)
    (/ n (expt guess (- root 1)))))

; then we can make a function that creates the nth root
; procedure using m repeated dampings

(define (nth-root-mth-damp n m)
  (lambda (num)
    (let ((f ((repeated average-damp m)
             (nth-root-fixed-point-proc n num))))
      (fixed-point .000001 f 1.0))))
    

; if we test it, we notice that it diverges whenever 
; m + 1 < n, but converges above that

(define sqrt-2-damp-1 (nth-root-mth-damp 2 1))
(define sqrt-3-damp-2 (nth-root-mth-damp 3 2))
(define sqrt-4-damp-3 (nth-root-mth-damp 4 3))
(define sqrt-5-damp-4 (nth-root-mth-damp 5 4))

(assert-close (sqrt-2-damp-1 9.0) 3.0)
(assert-close (sqrt-3-damp-2 8.0) 2.0)
(assert-close (sqrt-4-damp-3 16.0) 2.0)
(assert-close (sqrt-5-damp-4 32.0) 2.0)

; using this pattern, we can define our nth-root procedure generator

(define (nth-root n)
  (nth-root-mth-damp n (- n 1)))

(define root-10 (nth-root 10))

(assert-close (root-10 1024) 2)



