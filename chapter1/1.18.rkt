#lang racket
(require test-engine/racket-tests)

(define (fast-mult b n)
  (define (even? i) (= 0 (modulo i 2)))
  (define (iter odd-acumulator iter-b iter-n)
    (cond ((= iter-n 0) odd-acumulator)
          ((= iter-n 1) (+ odd-acumulator iter-b))
          ((even? iter-n) (iter odd-acumulator (+ iter-b iter-b) (/ iter-n 2)))
          (else (iter (+ odd-acumulator iter-b) iter-b (- iter-n 1)))))
  (iter 0 b n))

        
(check-expect (* 2 10) (fast-mult 2 10))
(check-expect (* 2 11) (fast-mult 2 11))
(check-expect (* 2 12) (fast-mult 2 12))
(check-expect 0 (fast-mult 0 10))
(check-expect 0 (fast-mult 10 0))

(test)