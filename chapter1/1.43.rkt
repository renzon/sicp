#lang racket
(require test-engine/racket-tests)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))
          

(check-expect 625 ((repeated square 2) 5))
(test)