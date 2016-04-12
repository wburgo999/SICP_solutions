; append - makes a new list/sequence thats composed of all the elements in arg1 and all the elements in arg2
; list - makes a sequence using the args as elements. If those args themselves are lists, they STAY lists
; cons - combines it's first arg with its second arg. In cons, the second element is just itself, in list
; the second element is a cons
; in tree diagram, sequences are leaves of a node
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")
(define x (list 1 2 3))
(define y (list 4 5 6))

(disp (append x y))
; prediction: (1 2 3 4 5 6)
(disp (cons x y))
; prediction ((1 2 3) 4 5 6)
(disp (list x y))
; predition ((1 2 3) (4 5 6))
