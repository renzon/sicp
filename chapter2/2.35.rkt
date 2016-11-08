#lang racket
(require test-engine/racket-tests)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op (car sequence) initial) (cdr sequence))))

(define (count-leaves t)
  (accumulate (lambda (sub-t previous-leaves)
                (if (pair? sub-t)
                    (+ previous-leaves (count-leaves sub-t))
                    (+ previous-leaves sub-t)))
              0
              (map (lambda (sub-t) (if (pair? sub-t) sub-t 1)) t)))

(check-expect (count-leaves null) 0)
(check-expect (count-leaves (list 1 2 3)) 3)
(check-expect (count-leaves (list 1 2 3 (list 2 3))) 5)
(check-expect (count-leaves (cons (list 1 2) (list 3 4))) 4)              

(test)
