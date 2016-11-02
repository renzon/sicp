#lang racket

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac
   (lambda (i) (if (= i 1) x (* x x -1)))
   (lambda (i) (+ 1.0 (* 2 (- i 1))))
   k))

(tan (/ 3.1415 4))
(tan-cf (/ 3.1415 4) 10)
