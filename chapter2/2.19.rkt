#lang racket
(require test-engine/racket-tests)

(define (cc amount coin-values)
  (define no-more? null?)
  (define except-first-denomination cdr)
  (define first-denomination car)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define us-coins (list 50 25 10 5 1))

(check-expect (cc 100 us-coins) 292)

; if n is the amount and c the length of coin-values, (expt n c) is the order of growth

(test)