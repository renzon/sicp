#lang racket
(require test-engine/racket-tests)
#|

T(p,q): 
a'=bq+aq+ap
b'=bp+aq

=>

T(0,1):

a'=b+a
b'=a

T(p', q'):
a''=b'q+a'q+a'p
b''=b'p+a'q

=>

a''=(bp+aq)q+(bq+aq+ap)q+(bq+aq+ap)p
b''=(bp+aq)p+(bq+aq+ap)q

=>
a''=(2pq+q^2)b+(2q^2+2pq+p^2)a =(2pq+q^2)b+(2pq+q^2)a + (p^2+q^2)a
b''=(p^2+q^2)b+(2pq+q^2)a

=>

p'=(p^2+q^2)
q'=(2pq+q^2)
|#
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a b
                   (+ (* p p) (* q q)) ; compute p’
                   (+ (* 2 p q) (* q q)) ; compute q’
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
        
(check-expect 0 (fib 0))
(check-expect 1 (fib 1))
(check-expect 1 (fib 2))
(check-expect 2 (fib 3))
(check-expect 3 (fib 4))
(check-expect 5 (fib 5))
(check-expect 8 (fib 6))

(test)