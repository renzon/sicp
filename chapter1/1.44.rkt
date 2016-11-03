#lang racket
(require test-engine/racket-tests)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))
          
(define (smooth f n)
  (define (average x)
    (define dx 0.0000001)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
  (repeated average n))
  
    

(check-within 0.0 ((smooth (lambda (x) x) 5) 0) 0.0001)
(test)