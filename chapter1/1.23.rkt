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
        (else (find-divisor n (next test-divisor)))))
(define (next divisor)
  (if (= divisor 2) 3 (+ divisor 2)))

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

(sqrt 10) = 3.16

Above 1000:
Old:
 1009 *** 0.0029296875
 1013 *** 0.003173828125
 1019 *** 0.0029296875
New:
 1009 *** 0.001953125
 1013 *** 0.001953125
 1019 *** 0.001953125
Improve: 3/2 ~1.5
 
Above 10000 :
Old:
 10007 *** 0.0068359375
 10009 *** 0.0068359375
 10037 *** 0.008056640625
New:
 10007 *** 0.0048828125
 10009 *** 0.005126953125
 10037 *** 0.0048828125
Improve: 7/5 ~ 1,4

Above 100000 (~ (23/7) 3.3 above time):
Old:
 100003 *** 0.02392578125
 100019 *** 0.02294921875
 100043 *** 0.022216796875
New:
 100003 *** 0.013916015625
 100019 *** 0.01416015625
 100043 *** 0.014892578125
Improve: 23/14 ~ 1.64

Above 1000000: (~ (70/23) 3.04 above time)
Old:
 1000003 *** 0.071044921875
 1000033 *** 0.06982421875
 1000037 *** 0.06982421875
New:
 1000003 *** 0.0439453125
 1000033 *** 0.044189453125
 1000037 *** 0.044189453125
Improve: 70/44 ~ 1.6

Besides halving input, ration improved almost 1.5. It is expected once order of growth is sqrt(n),
once (/ (sqrt (* 2 n)) (sqrt n))=(sqrt 2) ~ 1,4

|#