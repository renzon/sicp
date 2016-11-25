#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse sequence)
  (fold-right (lambda (x y) <??>) nil sequence))
(define (reverse-l sequence)
  (fold-left (lambda (x y) <??>) nil sequence))

(check-expect (reverse '(1 2 3 4)) ('4 3 2 1))
(check-expect (reverse-l '(1 2 3 4)) ('4 3 2 1))

(test)
