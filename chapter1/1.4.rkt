#lang racket
(require test-engine/racket-tests)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Once function is just another parameter, it will be
; (+ a b) when b is greater than 0
; (- a b) when b is less or equel than than 0

(check-expect 3 (a-plus-abs-b 1 2))
(check-expect 3 (a-plus-abs-b 1 -2))

(test)
