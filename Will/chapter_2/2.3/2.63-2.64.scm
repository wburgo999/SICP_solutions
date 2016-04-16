;; 2.63, 2.64
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

;; binary tree implementation

(define (make-tree val left right)
  (list val left right))

(define (value tree) (car tree))
(define (left tree) (cadr tree))
(define (right tree) (caddr tree))

(define subtree-1 (make-tree 1 '() '()))
(define subtree-2 (make-tree 3 '() '()))
(define subtree-3 (make-tree 5 '() '()))
(define subtree-4 (make-tree 7 '() '()))

(define tree-1 (make-tree 2 subtree-1 subtree-2))
(define tree-2 (make-tree 6 subtree-3 subtree-4))

(define root-tree (make-tree 4 tree-1 tree-2))

(assert-eq (value subtree-1) 1)
(assert-eq (value (left tree-1)) 1)
(assert-eq (value (right tree-1)) 3)

;; log(n)
(define (adjoin-tree x tree)
  (if (null? tree) 
    (make-tree x '() '())
    (let ((val (value tree))
          (left-tree (left tree))
          (right-tree (right tree)))
      (cond ((equal? x val) tree)
            ((> x val) 
             (make-tree val left-tree (adjoin-tree x right-tree)))
            ((< x val) 
             (make-tree val (adjoin-tree x left-tree) right-tree))))))

;; log(n)
(define (element-of-set? x tree)
  (if (null? tree)
    false
    (let ((val (value tree))
          (left-tree (left tree))
          (right-tree (right tree)))
      (cond ((equal? x val) true)
            ((> x val) (element-of-set? x right-tree))
            ((< x val) (element-of-set? x left-tree))))))

(define (element-of-ordered-set? x set)
  (cond ((null? set) false)
        ((< x (car set)) false)
        ((> x (car set)) (element-of-ordered-set? x (cdr set)))))

(assert-true (element-of-ordered-set? 1 (enumerate 1 10)))
(assert-false (element-of-ordered-set? 11 (enumerate 1 10)))

(assert-true (element-of-set? 1 root-tree))
(assert-true (element-of-set? 2 root-tree))
(assert-true (element-of-set? 3 root-tree))
(assert-true (element-of-set? 4 root-tree))
(assert-true (element-of-set? 5 root-tree))
(assert-true (element-of-set? 7 root-tree))
(assert-true (element-of-set? 6 root-tree))
(assert-false (element-of-set? 8 root-tree))

(define new-tree (adjoin-tree 8 (adjoin-tree 6 root-tree)))

(assert-true (element-of-set? 8 new-tree))
(assert-true (element-of-set? 6 new-tree))

(define (tree->list-1 tree)
  (cond ((and (null? (left tree)) (null? (right tree))) (list (value tree)))
        ((null? (left tree)) (append (list (value tree)) (tree->list-1 (right (tree)))))
        ((null? (right tree)) (append (tree->list-1 (right tree)) (list (value tree))))
        (else (append (tree->list-1 (left tree))
                      (list (value tree))
                      (tree->list-1 (right tree))))))

(assert-eq (tree->list-1 root-tree) (enumerate 1 7))

;; 2.63
(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left tree))
            (cons (value tree)
                  (tree->list-1 (right tree))))))

(assert-eq (tree->list-1 root-tree) (enumerate 1 7))

(define (tree->list-2 tree)
  (define (iter tree result)
    (if (null? tree)
      result
      (iter (left tree)
            (cons (value tree)
                  (iter (right tree) result)))))
  (iter tree '()))

(assert-eq (tree->list-2 root-tree) (enumerate 1 7))

;; testing it on trees from 2.16 - they're all the same! depth first traversal

(define subtree-1 (make-tree 1 '() '()))
(define subtree-2 (make-tree 5 '() '()))
(define subtree-3 (make-tree 11 '() '()))
(define tree-1 (make-tree 3 subtree-1 subtree-2))
(define tree-2 (make-tree 9 '() subtree-3))
(define root-tree (make-tree 7 tree-1 tree-2))

(assert-eq (tree->list-1 root-tree) (list 1 3 5 7 9 11))
(assert-eq (tree->list-2 root-tree) (list 1 3 5 7 9 11))

(define subsubtree-1 (make-tree 11 '() '()))
(define subtree-1 (make-tree 5 '() '()))
(define subtree-2 (make-tree 9 '() subsubtree-1))
(define tree-1 (make-tree 1 '()'()))
(define tree-2 (make-tree 7 subtree-1 subtree-2))
(define root-tree (make-tree 3 tree-1 tree-2))

(assert-eq (tree->list-1 root-tree) (list 1 3 5 7 9 11))
(assert-eq (tree->list-2 root-tree) (list 1 3 5 7 9 11))

(define subtree-1 (make-tree 1 '() '()))
(define subtree-2 (make-tree 7 '() '()))
(define subtree-3 (make-tree 11 '() '()))
(define tree-1 (make-tree 3 subtree-1 '()))
(define tree-2 (make-tree 9 subtree-2 subtree-3))
(define root-tree (make-tree 5 tree-1 tree-2))

(assert-eq (tree->list-1 root-tree) (list 1 3 5 7 9 11))
(assert-eq (tree->list-2 root-tree) (list 1 3 5 7 9 11))

;; the first one is slower because it uses append, and O(n) operation
;; they both traverse the tree completely, meaning they are called n times,
;; but (2) is O(1) in each call, whereas in (1) it's between n/2 steps and 1 step
;; actually, at each 'level' of the tree in (1), all the append steps will be about n/2
;; and there are log(n) 'levels', so our time complexity for (1) would be
;; nlog(n)


;; 2.64

(define (list->tree els)
  (car (partial-tree els (length els))))

(define (partial-tree els n)
  (if (= n 0)
    (cons '() els)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree els left-size)))
        (let ((left-tree (car left-result))
              (non-left-els (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-els))
                (right-result (partial-tree (cdr non-left-els)
                                            right-size)))
                (let ((right-tree (car right-result))
                      (remaining-els (cdr right-result)))
                  (cons (make-tree this-entry left-tree right-tree)
                        remaining-els))))))))

(assert-eq (tree->list-2 (list->tree (enumerate 1 10))) (enumerate 1 10))


;; partial-tree divides your list into 3 components - the left-half, the midpoint/center, and the right-half. It then calls make tree with the midpoint as the value and recursively calls iself on the left half and right half to make the left and right subtrees, respectively. Partial tree takes a list of elements and uses the first n of these elements to create the subtree of size n. The remaining elements are returned. That way after it creates the right sub tree using the left half of the elements, you can call partial tree again with the right-half (which are returned from the left half tree call) as the input elements.

;; 2.65
;; does append ruin the time complexity?
(define (union-set tree-set-1 tree-set-2)
  (define (union-ordered-set set1 set2)
    (define (iter set1 set2 result)
      (cond ((and (null? set1) (null? set2)) result)
            ((null? set1) (append result set2))
            ((null? set2) (append result set1))
            (else 
              (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((equal? x1 x2) (iter (cdr set1) (cdr set2) (append result (list x1))))
                      ((< x1 x2) (iter (cdr set1) set2 (append result (list x1))))
                      ((> x1 x2) (iter set1 (cdr set2) (append result (list x2)))))))))
    (iter set1 set2 '()))
  (let ((ordered-set-1 (tree->list-2 tree-set-1))
        (ordered-set-2 (tree->list-2 tree-set-2)))
    (let ((ordered-set-1-and-2 (union-ordered-set ordered-set-1 ordered-set-2)))
      (list->tree ordered-set-1-and-2))))

(define tree-set-1 (list->tree (enumerate 1 7)))
(define tree-set-2 (list->tree (enumerate 5 10)))

(tree->list-2 (union-set tree-set-1 tree-set-2))

(define (intersection-set tree-set-1 tree-set-2)
  (define (intersection-ordered-set set-1 set-2)
    (if (or (null? set-1) (null? set-2))
      '()
      (let ((x1 (car set-1)))
        (if (element-of-ordered-set? x1 set-2)
          (cons x1 (intersection-ordered-set (cdr set-1) set-2))
          (intersection-ordered-set (cdr set-1) set-2)))))
  (let ((ordered-set-1 (tree->list-2 tree-set-1))
        (ordered-set-2 (tree->list-2 tree-set-2)))
    (let ((ordered-set-1-and-2 (intersection-ordered-set ordered-set-1 ordered-set-2)))
      (list->tree ordered-set-1-and-2))))

(define tree-set-1 (list->tree (enumerate 1 7)))
(define tree-set-2 (list->tree (enumerate 5 10)))

(assert-eq (intersection-set tree-set-1 tree-set-2) (list->tree (list 5 6 7)))
