#lang racket
(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 10) (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square n) (* n n))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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
 1009 *** 0.013916015625
 1013 *** 0.01416015625
 1019 *** 0.015869140625

 
Above 10000 :
Old:
 10007 *** 0.0068359375
 10009 *** 0.0068359375
 10037 *** 0.008056640625
New:
 10007 *** 0.01904296875
 10009 *** 0.01806640625
 10037 *** 0.017822265625


Above 100000 (~ (23/7) 3.3 above time):
Old:
 100003 *** 0.02392578125
 100019 *** 0.02294921875
 100043 *** 0.022216796875
New:
 100003 *** 0.02099609375
 100019 *** 0.02099609375
 100043 *** 0.023193359375


Above 1000000: (~ (70/23) 3.04 above time)
Old:
 1000003 *** 0.071044921875
 1000033 *** 0.06982421875
 1000037 *** 0.06982421875
New:
 1000003 *** 0.02392578125
 1000033 *** 0.02392578125
 1000037 *** 0.02392578125

For small numbers fast-prime?  is worse in time because of been more complex and it's constant factor are signficant
But as number grow constant factor become insignificant and the expected behavior when multipling for 10
is a constant increase on time, once
(log (* 10 n)) = (+ (log 10) (log n)). So we can check the 0.003 increase each time 
|#