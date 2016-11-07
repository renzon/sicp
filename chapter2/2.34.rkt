#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

(check-expect (horner-eval 2 (list 1)) 1)
(check-expect (horner-eval 2 (list 3 1)) 7)
(check-expect (horner-eval 2 (list 5 0 3 1)) 47)
(check-expect (horner-eval 2 (list 1 0 5 0 3 1)) 79)

(test)
