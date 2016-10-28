#lang racket

(define (cube x) (* x x x))

(define (good-enough? guess x)
  (define diff (abs (- (cube guess) x))) 
  (< (/ diff x) 0.0000001))


(define (improve guess x)
  (/
   (+ (* 2 guess) (/ x (* guess guess)))
   3))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)
(cube-root 1000)
(cube-root 0.000000001)
