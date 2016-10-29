#lang racket
(require test-engine/racket-tests)


(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

#|
(A 1 10)

(A 0 (A 1 9))

(A 0 (A 0 (A 1 8)))

(A 0 (A 0 (A 0 (A 1 7))))

(A 0 (A 0 (A 0 (A 0 (A 1 6)))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1)))))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2))))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 2))))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4)))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 4)))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 8))))))

(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16)))))

(A 0 (A 0 (A 0 (A 0 (A 0 (* 2 16)))))

(A 0 (A 0 (A 0 (A 0 (A 0 32))))

(A 0 (A 0 (A 0 (A 0 (* 2 32))))

(A 0 (A 0 (A 0 (A 0 64)))

(A 0 (A 0 (A 0 (* 2 64)))

(A 0 (A 0 (A 0 128)))

(A 0 (A 0 (* 2 128)))

(A 0 (A 0 256))

(A 0 (* 2 256))

(A 0 528)

1024

|#


(check-expect 1024 (A 1 10))

#|
(A 2 4)

(A 1 (A 2 3))

(A 1 (A 1 (A 2 2)))

(A 1 (A 1 (A 1 (A 2 1))))

(A 1 (A 1 (A 1 2)))

(A 1 (A 1 (A 0 (A 1 1))))

(A 1 (A 1 (A 0 2)))

(A 1 (A 1 (* 2 2)))

(A 1 (A 1 4))

(A 1 (A 0 (A 1 3)))

(A 1 (A 0 (A 0 (A 1 2))))

(A 1 (A 0 (A 0 (A 0 (A 1 1)))))

(A 1 (A 0 (A 0 (A 0 2))))

(A 1 (A 0 (A 0 4)))

(A 1 (A 0 8))

(A 1 16)

(A 0 (A 1 15))

(A 0 (A 0 (A 1 14)))

...

(expt 2 16)

65536
|#

(check-expect 65536 (A 2 4))

#|
(A 3 3)

(A 2 (A 3 2))

(A 2 (A 2 (A 3 1)))

(A 2 (A 2 2))

(A 2 (A 1 (A 2 1)))

(A 2 (A 1 2))

(A 2 (A 1 2))

(A 2 (A 0 (A 1 1)))

(A 2 (A 0 2))

(A 2 4)

(A 1 (A 2 3))

(A 1 (A 1 (A 2 2)))

(A 1 (A 1 (A 1 (A 2 1))))

(A 1 (A 1 (A 1 2)))

(A 1 (A 1 (A 0 (A 1 1))))

(A 1 (A 1 (A 0 2)))

(A 1 (A 1 4))

(A 1 (A 0 (A 1 3)))

(A 1 (A 0 (A 0 (A 1 2))))

(A 1 (A 0 (A 0 (A 0 (A 1 1)))))

...

(A 1 16)

...

(expt 2 16)

65536
|#
(check-expect 65536 (A 3 3))

(define (f n) (A 0 n))
(define (double n) (* 2 n))

(check-expect (f 10) (double 10))

(define (g n) (A 1 n))
(define (expt-2 n) (expt 2 n))

(check-expect (g 10) (expt-2 10))

(define (h n) (A 2 n))
(define (expt-2-expt-2 n)
  (if (> n 1)
      (expt-2 (expt-2-expt-2 (- n 1)))
      2))

(check-expect (h 1) (expt-2-expt-2 1))
(check-expect (h 2) (expt-2-expt-2 2))
(check-expect (h 3) (expt-2-expt-2 3))
(check-expect (h 4) (expt-2-expt-2 4))

(define (k n) (* 5 n n)) ; 5*n^2


(test)