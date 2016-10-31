#lang racket
(require test-engine/racket-tests)

(define (fast-expt b n)
  (define (even? i) (= 0 (modulo i 2)))
  (define (iter odd-acumulator iter-b iter-n)
    (cond ((= iter-n 0) odd-acumulator)
          ((= iter-n 1) (* odd-acumulator iter-b))
          ((even? iter-n) (iter odd-acumulator (* iter-b iter-b) (/ iter-n 2)))
          (else (iter (* odd-acumulator iter-b) iter-b (- iter-n 1)))))
  (iter 1 b n))

        
(check-expect (expt 2 10) (fast-expt 2 10))
(check-expect (expt 2 11) (fast-expt 2 11))
(check-expect (expt 2 12) (fast-expt 2 12))

(test)