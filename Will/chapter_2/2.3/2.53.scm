; done
; purpose: gain familiarity with symbols
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(disp (list 'a 'b 'c)) ; (a b c)

(disp (list 'george)) ; (george)

(disp (cdr '((x1 x2) (y1 y2)))) ; ((y1 y2))

(disp (cadr '((x1 x2) (y1 y2)))) ; (y1 y2)

(pair? (car '(a short list))) ; #f

(memq 'red '((red shoes) (blue socks))) ; #f

(memq 'red '(red shoes blue socks)) ; (red shoes blue socks)
