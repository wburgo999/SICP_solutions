;done
;purpose
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(assert-eq (car ''abracadabra) 'quote)

;because this is equivalent to

(assert-eq (car (quote (quote abracadabra))) 'quote)
