;; (print [EXP1 ...])
;; Outputs the optional arguments EXP1 ... using display and writes a newline character to the port that is the value of (current-output-port). Returns (void).
(print "\n" '10')
(print 10)

(print "\n" '(+ 5 3 4)')
(print (+ 5 3 4))

(print "\n" '(- 9 1)')
(print (- 9 1))

(print "\n"  '(/ 6 2)')
(print (/ 6 2))

(print "\n" '(+ (* 2 4) (- 4 6))')
(print (+ (* 2 4) (- 4 6)))

(print "\n" '(define a 3)')
(define a 3)

(print "\n" '(define b (+ a 1))')
(define b (+ a 1))

(print "\n" '(+ a b (* a b))')
(print (+ a b (* a b)))

(print "\n" '(= a b)')
(print (= a b))

(print "\n" '(if (and (> b a) (< b (* a b)))
 	   b a)')
(print (if (and (> b a) (< b (* a b)))
	   b a))

(print "\n" '(cond ((= a 4) 6)
		   ((= b 4) (+ 6 7 a))
		   (else 25))')
(print (cond ((= a 4) 6)
		   ((= b 4) (+ 6 7 a))
		   (else 25)))

(print "\n" '(+ 2 (if (> b a) b a))')
(print (+ 2 (if (> b a) b a)))

(print "\n" '(* (cond ((> a b) a) ((< a b) b)
		      (else -1)) (+ a 1))')
(print (* (cond ((> a b) a) ((< a b) b)
		(else -1)) (+ a 1)))
