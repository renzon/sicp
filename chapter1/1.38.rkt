#lang racket

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
        
  (iter k 0))

(define (d i)
  (if (= 2 (modulo i 3))
      (* (/ (+ i 1) 3) 2)
      1))

(+ 2
   (cont-frac (lambda (i) 1.0)
              d
              11))
(exp 1)
