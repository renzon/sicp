#lang racket
(require test-engine/racket-tests)

; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

    
(check-expect 0 (f 0))
(check-expect 1 (f 1))
(check-expect 2 (f 2))
(check-expect 4 (f 3))
(check-expect 11 (f 4))

; iterative process

(define (g n)
  (define (iter v1 v2 v3 step)
    (define new_v1 (+ v1 v2 v3))
    (if (= 0 step)
        new_v1
        (iter new_v1 (* 2 v1) (* 3 (/ v2 2)) (- step 1))))
  (if (< n 3)
      n
      (iter 2 2 0 (- n 3))))
    
(check-expect 0 (g 0))
(check-expect 1 (g 1))
(check-expect 2 (g 2))
(check-expect 4 (g 3))
(check-expect 11 (g 4))
(test)