#lang racket
(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n) (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n) (* n n))

(define (search-for-primes min max)
  (display "################ Range ")
  (display max)
  (define odd-min (if (= 1 (modulo min 2)) min (+ min 1)))
  (define (run i)
    (timed-prime-test i)
    (cond ((< i max) (run (+ i 1)))))
  (run odd-min))



(search-for-primes 1000 1020)
(search-for-primes 10000 10038)
(search-for-primes 100000 100044)
(search-for-primes 1000000 1000038)

#| Results:

Above 1000:
1009 *** 0.0029296875
1013 *** 0.003173828125
1019 *** 0.0029296875

Above 10000:
10007 *** 0.0068359375
10009 *** 0.0068359375
10037 *** 0.008056640625

Above 100000:
100003 *** 0.02392578125
100019 *** 0.02294921875
100043 *** 0.022216796875

Above 1000000:
1000003 *** 0.071044921875
1000033 *** 0.06982421875
1000037 *** 0.06982421875
|#