#lang racket
(require test-engine/racket-tests)

(define (square-list items)
  (if (null? items)
      (list)
      (cons (* (car items) (car items)) (square-list(cdr items)))))

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items))

(check-expect (square-list (list 1 2 3 4)) (list 1 4 9 16))
(check-expect (square-list-2 (list 1 2 3 4)) (list 1 4 9 16))

(test)