#lang racket
(require test-engine/racket-tests)

(define (last-pair lst)
  (define (last-pair-iter lst)
        (let ((next-list (cdr lst)))
          (if (null? next-list)
              (car lst)
              (last-pair-iter next-list))))
  (if (null? lst)
      (error "List must not be empty")
      (last-pair-iter lst)))

(check-expect (last-pair (list -2 1 -3 4 -1 2 1 -5 4)) 4)
(check-error (last-pair (list )))

(test)