#lang racket
(require test-engine/racket-tests)

; Problem from https://codility.com/programmers/lessons/1-iterations/binary_gap/

(define (binary-gap n)
  (define (bynary-iter n i current-max)
    (if (= n 0)
        (max i current-max)
        (if (= (modulo n 2) 1)
            (bynary-iter (quotient n 2) 0 (max i current-max))
            (bynary-iter (quotient n 2) (+ i 1) (max i current-max)))))
  (bynary-iter n 0 0))

(check-expect (binary-gap 9) 2)
(check-expect (binary-gap 529) 4)
(check-expect (binary-gap 1041) 5)

(test)