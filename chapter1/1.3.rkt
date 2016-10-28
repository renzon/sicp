#lang racket
(require test-engine/racket-tests)

(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (sum-square-2-bigger-numbers a b c)
  (if (and (< a b) (< a c))
      (sum-square b c) ;Rotate until minor element is found
      (sum-square-2-bigger-numbers c a b)
  )
)

(check-expect 13 (sum-square-2-bigger-numbers 1 2 3))
(check-expect 13 (sum-square-2-bigger-numbers 1 3 2))
(check-expect 13 (sum-square-2-bigger-numbers 2 1 3))
(check-expect 13 (sum-square-2-bigger-numbers 2 3 1))
(check-expect 13 (sum-square-2-bigger-numbers 3 2 1))
(check-expect 13 (sum-square-2-bigger-numbers 3 1 2))

(test)
