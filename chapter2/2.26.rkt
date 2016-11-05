#lang racket
(require test-engine/racket-tests)

(define (first lst)
  (car (cdr (car (cdr (cdr lst))))))

(define (second lst)
  (car (car lst)))

(define (third lst)
  (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr lst)))))))))))))

(check-expect (first (list 1 3 (list 5 7) 9)) 7)
(check-expect (second (list (list 7))) 7)
(check-expect (third (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))) 7) 

(test)