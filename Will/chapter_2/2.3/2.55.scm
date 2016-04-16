;; 2.55
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(assert-eq (car ''abracadabra) 'quote)

;; because this is equivalent to

(car (quote (quote abracadabra)))

