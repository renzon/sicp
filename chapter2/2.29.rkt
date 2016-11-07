#lang racket
(require test-engine/racket-tests)

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (cdr branch))

(define (total-weight mobile)
  (define (branch-weight branch)
    (total-weight (branch-structure branch)))
  (if (pair? mobile)  
      (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile)))
      mobile))

(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))
  (define (balanced-branch? branch)
    (balanced? (branch-structure branch)))
  
  (if (pair? mobile)
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and
         (balanced-branch? left)
         (balanced-branch? right)
         (= (torque left) (torque right))))
      #t))
  
        
(define l-branch (make-branch 1 2))
(define r-branch (make-branch 3 4))
(define mobile (make-mobile l-branch r-branch))
(define double-two-mobile (make-mobile l-branch l-branch))

(define coumpound-branch (make-branch 3 double-two-mobile))
(define coumpound-mobile (make-mobile coumpound-branch r-branch))

(define coumpound-branch-2 (make-branch 4 double-two-mobile))
(define unbalanced-coumpound-mobile (make-mobile coumpound-branch-2 r-branch))
(check-expect (branch-length (left-branch mobile)) 1)
(check-expect (branch-structure (right-branch mobile)) 4)
(check-expect (total-weight mobile) 6)
(check-expect (total-weight double-two-mobile) 4)
(check-expect (total-weight coumpound-mobile) 8)

(check-expect (balanced? mobile) #f)
(check-expect (balanced? double-two-mobile) #t)
(check-expect (balanced? coumpound-mobile) #t)
(check-expect (balanced? unbalanced-coumpound-mobile) #f)

(test)