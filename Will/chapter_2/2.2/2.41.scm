; done
; purpose: again, to get you to think about flatmaps

(load "../../helpers/utils.scm")
(load "../../helpers/test-lib.scm")

(define (unique-triplets n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list k j i))
                             (enumerate 1 j)))
                      (enumerate 1 i)))
           (enumerate 1 n)))

(assert-eq (unique-triplets 1) (list (list 1 1 1)))
(assert-eq (unique-triplets 2) (list (list 1 1 1) (list 1 1 2) (list 1 2 2) (list 2 2 2)))

(define (triplets-sum-to-k k n)
  (filter (lambda (triplet)
            (= k (sum triplet)))
          (unique-triplets n)))

(assert-eq (triplets-sum-to-k 10 5) (list (list 3 3 4) (list 2 4 4) (list 2 3 5) (list 1 4 5)))
