#lang racket
(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; Applicative-order evaluation:

(test 0 (p)) ;substitution of expressions

(if (= 0 0) 0 (p)) ;(p) never get evaluated

0

; normal order

(test 0 (p)) ;infinity recursion while evaluating (p)