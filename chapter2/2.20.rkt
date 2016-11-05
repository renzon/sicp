#lang racket
(require test-engine/racket-tests)

(define (same-parity first . lst)
  (define (two-parity x) (modulo x 2))
  (let ((parity (two-parity first)))
    (define (same-parity-iter result lst)
      (if (null? lst)
          result
          (let ((next (car lst)))
            (if (= parity (two-parity next))
                (same-parity-iter (append result (list next)) (cdr lst))
                (same-parity-iter result (cdr lst))))))
    (same-parity-iter (list first) lst)))
     
(check-expect (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-expect (same-parity 2 3 4 5 6 7) (list 2 4 6))

(test)