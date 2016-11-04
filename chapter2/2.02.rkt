#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment p-s p-e)
  (cons p-s p-e))

(define (start-segment p) (car p))
(define (end-segment p) (cdr p))

  


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (mid-point segment)
  (define (average x y) (/ (+ x y) 2))
  (make-point
   (average (x-point (start-segment segment)) (x-point (end-segment segment)))
   (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

(define p1 (make-point 1 2))
(define p2 (make-point -1 4))

(define seg (make-segment p1 p2))
(print-point (mid-point seg))