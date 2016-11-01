#lang racket
(require test-engine/racket-tests)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (inc n) (+ n 1))
(define (identity n) n)
(check-expect 120 (accumulate-iter * 1 identity 1 inc 5))
(check-expect 120 (accumulate * 1 identity 1 inc 5))

(check-expect 15 (accumulate-iter + 0 identity 1 inc 5))
(check-expect 15 (accumulate + 0 identity 1 inc 5))


(test)