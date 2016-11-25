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

(define (queens board-size)
  (define empty-board null)
  (define (adjoin-position new-row k rest-of-queens)
    (append (list (list new-row k)) rest-of-queens ))
  (define (safe? k positions)
    (let ((current-position (car positions)))
      (let ((x (car current-position)))
        (define (compare rest-of-positions)
          (if (not (pair? rest-of-positions))
              #t
              (let ((other-position (car rest-of-positions)))
                (let ((other-x (car other-position))
                      (other-y (cadr other-position)))
                  (cond ((= x other-x) #f)
                        ((= (- k x) (- other-y other-x)) #f)
                        ((= (+ k x) (+ other-y other-x)) #f)
                        (else (compare (cdr rest-of-positions))))))))
        (compare (cdr positions)))))
        
        
    
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(check-expect (queens 1) '(((1 1))))
(check-expect (queens 2) '())
(check-expect (queens 3) '())
(check-expect (queens 4) '(((2 4) (4 3) (1 2) (3 1)) ((3 4) (1 3) (4 2) (2 1))))

(test)
