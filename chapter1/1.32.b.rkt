#lang racket
(require test-engine/racket-tests)


(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

(define (inc x) (+ x 1))

(define (relative-prime? n)
  (define (inner i) (= 1 (gcd i n)))
  inner)

(define (identity x) x)

(check-expect 24 (filtered-accumulate * 1 identity 1 inc 5 (relative-prime? 5)))
(check-expect 5 (filtered-accumulate * 1 identity 1 inc 6 (relative-prime? 6)))
(check-expect 720 (filtered-accumulate * 1 identity 1 inc 7 (relative-prime? 7)))



(test)