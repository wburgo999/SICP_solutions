; TODO
(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (expmod base exp mod)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    mod))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     mod))))

(define (miller-rabin n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


