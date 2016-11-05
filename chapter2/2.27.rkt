#lang racket
(require test-engine/racket-tests)

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse lst)
  (if (pair? lst)
      (append (deep-reverse (cdr lst)) (list (deep-reverse (car lst))))
      lst))

(check-expect (deep-reverse 2) 2)
(check-expect (deep-reverse (list 2 1)) (list 1 2))
(check-expect (deep-reverse x) (list (list 4 3) (list 2 1)))

(test)