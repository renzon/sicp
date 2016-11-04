#lang racket
(require test-engine/racket-tests)

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (extract base n)
  (define (iter i number)
    (if (> (modulo number base) 0)
        i
        (iter (+ i 1) (/ number base))))
  (iter 0 n))

(define (car z) (extract 2 z))
(define (cdr z) (extract 3 z))
 
(check-expect 0 (car 1))
(check-expect 0 (car 3))
(check-expect 0 (car 9))
(check-expect 0 (car 27))
(check-expect 1 (car 2))
(check-expect 2 (car 12))
(check-expect 3 (car 72))
(check-expect 4 (car 16))


(check-expect 0 (cdr 1))
(check-expect 0 (cdr 2))
(check-expect 0 (cdr 4))
(check-expect 0 (cdr 8))

(check-expect 1 (cdr 3))
(check-expect 2 (cdr 18))
(check-expect 3 (cdr 54))
(check-expect 4 (cdr 81))

(check-expect 10 (car (cons 10 9)))
(check-expect 9 (cdr (cons 10 9)))

(test)