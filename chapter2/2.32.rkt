#lang racket
(require test-engine/racket-tests)

(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subset) (append (list (car s)) subset))
                          rest)))))

(define subs (list (list) (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))
(check-expect (subsets (list 1 2 3)) subs)
(test)

#|
Subset of empty set is {{}} 
For no empty, be n a element of set, subsets are {n} union with each subset of s - {n}
|#