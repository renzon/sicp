#lang racket
(require test-engine/racket-tests)

(define (for-each f lst)
  (if (null? lst)
      (newline)
      (let((a (f (car lst))))
        (for-each f (cdr lst)))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

(test)