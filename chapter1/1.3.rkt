#lang racket

(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (sum-square-2-bigger-numbers a b c)
  (if (and (< a b) (< a c))
      (sum-square b c)
      (sum-square-2-bigger-numbers c a b)
  )
)

(sum-square-2-bigger-numbers 1 2 3)
(sum-square-2-bigger-numbers 1 2 3)
(sum-square-2-bigger-numbers 2 3 1)
(sum-square-2-bigger-numbers 2 1 3)
(sum-square-2-bigger-numbers 3 1 2)
(sum-square-2-bigger-numbers 3 2 1)

