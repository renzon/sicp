#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (inc i) (+ i 1))
  (define (term k)
    (define y-k (f(+ a (* k h))))
    (cond ((or (= k 0) (= k n)) y-k)
          ((= (modulo k 2) 0) (* 2 y-k))
          (else (* 4 y-k))))
  (define (iter-sum)
    (sum term 0 inc n))
  (/ (* h (iter-sum)) 3))

(define (cube x) (* x x x))

(integral cube 0.0 1.0 100)
(integral cube 0.0 1.0 1000)

#|
Results:
Using Simpson Rule:
(integral cube 0.0 1.0 100)
0.24999999999999992
(integral cube 0.0 1.0 1000)
0.2500000000000003

Result of the 1.3.1 section:
(integral cube 0 1 0.01)
.24998750000000042
(integral cube 0 1 0.001)
.249999875000001

|#