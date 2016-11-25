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

(check-expect (fold-right / 1 (list 1 2 3)) (+ 1 1/2))
(check-expect (fold-left / 1 (list 1 2 3)) 1/6)
(check-expect (fold-right list null (list 1 2 3)) '(3 (2 (1 ()))))
(check-expect (fold-left list null (list 1 2 3)) '(((() 1) 2) 3))

; to be equal the op need to be reflexive:  (= (op a b) (op b a))
(check-expect (fold-right + 0 (list 1 2 3 4)) 10)
(check-expect (fold-left + 0 (list 1 2 3 4)) 10)

(test)
