; done - but write out substitution model in LaTeX
; it's originally a log_2(n) algorithm, but by rewriting it this way, you are making a tree recursive
; function that makes 2 separate calls EVERY time the function is called, so it gets called 2^x,
; where each 'x' is our log_2(n) algorithm, meaning we have 2^log_2(n) = n
