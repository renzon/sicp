#lang racket
(require test-engine/racket-tests)

(define (reverse lst)
  (define (reverse-iter r-lst lst)
    (if (null? lst)
        r-lst
        (reverse-iter (cons (car lst) r-lst) (cdr lst))))
  (reverse-iter (list) lst))

(check-expect (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))
(check-expect (reverse (list)) (list))

(test)