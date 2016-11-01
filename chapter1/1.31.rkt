#lang racket
(require test-engine/racket-tests)

(define (mul term a next b)
  (if (> a b)
      1
      (* (term a)
         (mul term (next a) next b))))

(define (mul-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc n) (+ n 1))
(define (identity n) n)
(check-expect 120 (mul-iter identity 1 inc 5))
(check-expect 120 (mul identity 1 inc 5))

(test)