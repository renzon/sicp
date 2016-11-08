#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(check-expect (accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12))) (list 22 26 30))

(test)
