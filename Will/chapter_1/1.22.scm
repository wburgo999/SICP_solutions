; TODO: make it neater, kind of messy atm
; this is problem 1.22 and 1.23
; 1.23 - the reason it's different is because the runtime for prime? for even numbers is very fast, because
; they are immediately eliminated when it checks if they're divisible by 2
(load "../helpers/utils.scm")
(load "../helpers/test-lib.scm")

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time) n)))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (cond ((even? start) (search-for-primes (+ start 1) end))
        ((not (> start end))
         (begin
           (timed-prime-test start)
           (search-for-primes (+ start 2) end)))))


(disp (search-for-primes 100000000000 100000000100))
