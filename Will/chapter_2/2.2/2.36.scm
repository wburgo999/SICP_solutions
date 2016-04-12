; done - redo,  this is hard
; purpose: accumulations within accumulations! it shows how an accumulation is really just an abstration of combining things for lists
; cons combines something into a pair, but an accumulation combines any sequence in any way possible
; the sequence is a 'common interface' for representing data. Accumulate is a way of combining it. 
; More specifically, reduce can reduce data to a value through combinations, map can transform data
; and filter can get rid of data you don't want (no point in creating additional data, because you can't increase
; information, just increase noise)
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

