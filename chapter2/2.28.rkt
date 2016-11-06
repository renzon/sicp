#lang racket
(require test-engine/racket-tests)



(define (fringe lst)
  (if (pair? lst)
      (append (fringe (car lst)) (fringe (cdr lst))) 
      (if (null? lst) (list) (list lst))))

(define x (list (list 1 2) (list 3 4)))
(check-expect (fringe (list x x)) (list 1 2 3 4 1 2 3 4))

(test)