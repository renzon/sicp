#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define v (list 1 2))

(define m (list v v))

(define (matrix-*-vector m v) (map (lambda (row) (dot-product row v)) m))

(define (insert-last x lst)
  (if (pair? lst)
      (cons (car lst) (insert-last x (cdr lst)))
      (cons x null)))
(define (transpose mat) (accumulate-n insert-last null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(check-expect (transpose (list (list 1 2)(list 3 4))) (list (list 1 3) (list 2 4)))
(check-expect (matrix-*-matrix
               (list
                (list 1 2 3)
                (list 4 5 6))
               (list
                (list 7 8)
                (list 9 10)
                (list 11 12)))
              (list (list 58 64) (list 139 154)))


(check-expect (dot-product v v) 5)
(check-expect (matrix-*-vector m v) (list 5 5))

(check-expect (matrix-*-matrix m m) (list (list 3 6) (list 3 6)))

(test)
