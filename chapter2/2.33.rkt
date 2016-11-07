#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (map p sequence)
  (accumulate (lambda (x y) (append y (list (p x)))) (list) sequence))

(define (square x) (* x x))

(define (length sequence) (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(check-expect (accumulate + 0 (list 1 2 3)) 6)
(check-expect (map  square (list 1 2 3)) (list 1 4 9))
(check-expect (length (list 1 2 3)) 3)
(test)

#|
Subset of empty set is {{}} 
For no empty, be n a element of set, subsets are {n} union with each subset of s - {n}
|#