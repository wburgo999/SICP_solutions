;; 2.65
(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define record cdr)
(define key car)
(define make-record cons)

(define (lookup given-key records)
  (if (null? records)
    false
    (let ((val (key (value records)))
          (data (record (value records)))
          (left-tree (left records))
          (right-tree (right records)))
      (cond ((equal? val given-key) data)
            ((> val given-key) (lookup given-key right-tree))
            ((< val given-key) (lookup given-key left-tree))))))

(define entry-1 (make-record 1 (list "will" "software engineer")))

(assert-eq (record entry-1) (list "will" "software engineer"))
(assert-eq (key entry-1) 1)

(define entry-2 (make-record 2 (list "Danny" "programmer")))
(define entry-3 (make-record 3 (list "Mike" "programmer")))
(define entry-4 (make-record 4 (list "Scott" "programmer")))
(define entry-5 (make-record 5 (list "Vanessa" "data science")))






