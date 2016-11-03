#lang racket

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((y (f guess)))
      (let ((next (/ (+ y (/ guess y)) 2)))
        (display next)
        (newline)
        (if (close-enough? guess next)
            next
            (try next)))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (define (cube x)
    (+
     (* x x x)
     (* a x x)
     (* b x )
     c))
  cube)

(newtons-method (cubic 1 1 1) 1)