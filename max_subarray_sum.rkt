#lang racket
(require test-engine/racket-tests)

(define (max-sub-sum seq)
  (define (iter seq current_sum max_sum)
    (if (null? seq)
        max_sum
        (let ((new_sum (+ current_sum (car seq))))
          (iter (cdr seq) (max new_sum 0) (max new_sum max_sum)))))
  (iter seq 0 0))

(check-expect (max-sub-sum (list -2 1 -3 4 -1 2 1 -5 4)) 6)

(test)