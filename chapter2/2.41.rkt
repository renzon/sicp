#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (enumerate-interval i n)
  (define (iter i n result)
    (if (< n i)
        result
        (iter i (- n 1) (cons n result))))
  (iter i n null))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (map
         (lambda (k) (list i j k))
         (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (sum-triple n)
  (filter
   (lambda (triple)
     (= n (accumulate + 0 triple)))
   (unique-triples n)))
  
(check-expect (sum-triple 8) '((5 2 1) (4 3 1)))
(check-expect (sum-triple 6) '((3 2 1)))
(check-expect (sum-triple 7) '((4 2 1)))
(check-expect (sum-triple 9) '((6 2 1) (5 3 1) (4 3 2)))

(test)
