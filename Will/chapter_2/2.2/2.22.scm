(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

; let the input be a list of numbers (e1 e2 e3 ... en), then, using the substitution model,
; in the first step you make (cons e1 answer)
; second step: (cons e2 (cons e1 answer))
; step n: (cons e_n (...(cons e2 (cons e1 answer))))
; so you get the reverse order list
;
; Similarly, in the second version, first step: (cons '() e1)
; second step: ((cons '() e1) e2)
; step n: (..(cons '() e1)..) e_n)
; In scheme, a list has a value as it's first element, and then a pointer to the 'rest' which is a pair. The last element has a pointer to the empty list as it's 'rest' value. 
; Here, it is reversed. We have the second value as the elment value, and the first value as a pointer to 'the rest'
; This could totally work as a way to represent lists, but it's not the way scheme does it.
