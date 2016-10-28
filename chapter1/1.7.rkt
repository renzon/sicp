#lang racket

(define (square x) (* x x))
#|

(define (good-enough? guess x)
  (define diff (abs (- (square guess) x))) 
  (< diff 0.001))

good-enough above will not work for small numbers because their difference are going
to be also small. So if 0.0000000001 is used as parameter the result is
 0.03125000106562499, which is bad compared to 0.00001, the proper solution.
This happens because (= (square 0.03125000106562499) 0.000976562566601563) which
is less than 0.0001.

On the other hand big number will fall on infinite recursion because they
loose precision. With calculation 1e+50 as example. Getting difference between
(square guess) and this paremeter will net get as short as 0.0001

So for both elative aproach is needed. E.g.the difference is calculated
relatively to x and work for both small and bigger numbers.
|#

(define (good-enough? guess x)
  (define diff (abs (- (square guess) x))) 
  (< (/ diff x) 0.0000001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 1e+50)
(sqrt 0.0000000001)
