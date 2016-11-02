#lang racket



(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
11)

(/ 2 (+ 1 (sqrt 5))) ; 1/golden ration