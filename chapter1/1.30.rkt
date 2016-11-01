#lang racket
(require test-engine/racket-tests)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (inc n) (+ n 1))
(define (identity n) n)
(check-expect 15 (sum-iter identity 1 inc 5))

(test)