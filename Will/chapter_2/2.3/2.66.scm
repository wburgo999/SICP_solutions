;; Huffman trees!
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

;; stratified design
;; LEVEL: huffman trees PROCS: decode, encode, make-from-message
;; LEVEL: NODES - leaf and non-leaf. constructors: make-leaf, make-tree, Selectors: weight, symbol, left-branch, right-branch, symbol-list, PREDICATES: is-leaf?


;; leaf nodes
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbol-leaf leaf)
  (cadr leaf))

(define (weight-leaf leaf)
  (caddr leaf))

(define (leaf? node)
  (eq? 'leaf (car node)))

;;TESTS
(define leaf-1 (make-leaf 'A 8))
(define leaf-2 (make-leaf 'B 3))
(define leaf-3 (make-leaf 'C 1))
(define leaf-4 (make-leaf 'D 1))
(define leaf-5 (make-leaf 'E 1))
(define leaf-6 (make-leaf 'F 1))
(define leaf-7 (make-leaf 'G 1))
(define leaf-8 (make-leaf 'H 1))
(assert-eq (symbol-leaf leaf-1) 'A)
(assert-eq (weight-leaf leaf-1) '8)
(assert-true (leaf? leaf-1))
(assert-false (leaf? (list 'hello 'world)))

;; non-leaf nodes
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols node)
  (if (leaf? node)
    (list (symbol-leaf node))
    (caddr node)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))


;;TESTS
(define tree-1 (make-code-tree leaf-7 leaf-8))
(define tree-2 (make-code-tree leaf-5 leaf-6))
(define tree-3 (make-code-tree tree-2 tree-1))
(define tree-4 (make-code-tree leaf-3 leaf-4))
(define tree-5 (make-code-tree leaf-2 tree-4))
(define tree-6 (make-code-tree tree-5 tree-3))
(define tree-7 (make-code-tree leaf-1 tree-6))

(assert-eq (left-branch tree-1) leaf-7)
(assert-eq (right-branch tree-1) leaf-8)
(assert-eq (symbols tree-1) (list 'G 'H))
(assert-eq (weight tree-1) 2)
(assert-eq (weight tree-7) 17)

(define huffman-tree tree-7)

(define (choose-branch bit)
  (cond ((= 0 bit) left-branch)
        ((= 1 bit) right-branch)
        (else (error "not a bit -- value must be 0 or 1"))))

(define (decode bits tree)
  (define (decode-bit bits node)
    (cond ((is-leaf? node) (cons (symbol-leaf node) (decode-bit bits tree)))
          ((null? bits) '())
          (else (decode-bit (cdr bits) ((choose-branch (car bits)) node)))))
  (decode-bit bits tree))

(define test-bits (list 1 1 0 1 1 1 1 1 0))

(decode test-bits huffman-tree)

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define test-set (adjoin-set leaf-1 '()))

(assert-eq (adjoin-set leaf-2 test-set) (list leaf-2 leaf-1))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define test-pairs (list (list 'A 8) (list 'B 3) (list 'C 1) (list 'D 1)))

(make-leaf-set test-pairs)

;; 2.67
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(assert-eq (decode sample-message sample-tree) '(A D A B B C A))


;; 2.68
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (iter symbol path subtree)
    (cond ((leaf? subtree) path)
          ((element-of-set? symbol (symbols (left-branch subtree)))
           (iter symbol (append path (list 0)) (left-branch subtree)))
          ((element-of-set? symbol (symbols (right-branch subtree)))
           (iter symbol (append path (list 1)) (right-branch subtree)))
          (else (error "symbol not in tree"))))
  (iter symbol '() tree))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (element-of-set x (cdr set)))))

(assert-eq (encode-symbol 'C sample-tree) (list 1 1 1))
(assert-eq (encode-symbol 'D sample-tree) (list 1 1 0))
(assert-eq (encode-symbol 'B sample-tree) (list 1 0))
(assert-eq (encode-symbol 'A sample-tree) (list 0))

(assert-eq (encode '(A D A B B C A) sample-tree) sample-message)

;; 2.69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (cond ((null? (cdr leaf-set)) (car leaf-set))
        (else (successive-merge
                (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                            (cddr leaf-set))))))

;; it's backwards!! why!?!?! :(
(define test-huffman (generate-huffman-tree test-pairs))

(assert-eq (encode '(A D A B C C A) test-huffman) (list 1 0 0 0 1 0 1 0 0 1 0 0 1 1))

(assert-eq (decode (list 1 0 0 0 1 0 1 0 0 1 0 0 1 1) test-huffman) '(A D A B C C A))


;; 2.70

(define huffman-tree (generate-huffman-tree
                       (list (list 'A 2) (list 'BOOM 1) (list 'GET 2)
                             (list 'JOB 2) (list 'NA 16) (list 'SHA 3)
                             (list 'YIP 9) (list 'WAH 1))))

(define pop-song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define pop-song-encoding (encode pop-song huffman-tree))

(assert-eq (length pop-song-encoding) 84)

(assert-eq (decode pop-song-encoding huffman-tree) pop-song)

;; if we used fixed-length, we would need 3 bits per 'symbol' since there are 8 symbols total. There are a total of (+ 2 1 2 2 16 3 9 1) = 36 occurences, so we would need 3 * 36 = 108 bits, compared to the 84 above, about a 22.2% savings

;; 2.71
;; the left branch at every part will be a leaf node, meaning that with an alphabet with occurences (2^n, 2^(n-1), ...., 2^2, 2, 1) the corresponding symbols are encoded by, respectively (0, 10, 110, 1110, 11110, 111110, ......, 11111111..11111). This is because t2^n = sum (s^j) for j from 1 to (n-1) + 1, so there are more occurences of a symbol than all the less frequent symbols put together, meaning it should have its own entire side of a tree because the savings from reducing its length by 1 bit is greater than the savings from any of the others


;; 2.72
;; take special case in 2.71
;; MOST FREQUENT SYMBOL
;; For encoding a SPECIFIC symbol it's just O(1) because it's the leftmost branch
;; LEAST FREQUENT SYMBOL
;; you have the search through of the lists of the right branches which is n + (n-1) + (n-2) + ... + 2 + 1 ~ O(n^2).
;; so worst case might be if you have m symbols which are each the least frequenctly used, then we have O(m*n) to encode a message. There's also the appending of the encodings, which is 1 + 2 + 3 + .... + (m-1) + m = O(m^2), so this could become large if the message is extremely large. An easy remedy would be flatmap it at the end and get it down to O(m)


    
