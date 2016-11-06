#lang racket
(require test-engine/racket-tests)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (car (cdr mobile)))


(define (branch-length branch) (car branch))

(define (branch-structure branch) (car (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight structure)
    (cond ((null? structure) 0)
          ((pair? structure) (branch-weight (branch-structure structure)))
          (else structure)))
    
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))
        
(define l-branch (make-branch 1 2))
(define r-branch (make-branch 3 4))
(define mobile (make-mobile l-branch r-branch))

(check-expect (branch-length (left-branch mobile)) 1)
(check-expect (branch-structure (right-branch mobile)) 4)
(check-expect (total-weight mobile) 6)
(check-expect (total-weight(make-mobile l-branch l-branch)) 4)

(test)