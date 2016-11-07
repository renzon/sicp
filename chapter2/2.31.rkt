#lang racket
(require test-engine/racket-tests)

(define (square x) (* x x))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))
(define squared-tree (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(check-expect (tree-map square tree) squared-tree)
(test)