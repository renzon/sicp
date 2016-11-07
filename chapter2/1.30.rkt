#lang racket
(require test-engine/racket-tests)

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))
(define squared-tree (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(check-expect (square-tree tree) squared-tree)

(test)