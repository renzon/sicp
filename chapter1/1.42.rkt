#lang racket
(require test-engine/racket-tests)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

(check-expect 49 ((compose square inc) 6))
(test)