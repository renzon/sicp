#lang racket
(require test-engine/racket-tests)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(check-expect 21 (((double (double double)) inc) 5))
(test)