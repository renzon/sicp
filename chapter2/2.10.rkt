#lang racket
(require test-engine/racket-tests)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x (make-interval (* -1 (upper-bound y))
                                 (* -1 (lower-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (or (= 0 (upper-bound y)) (= 0 (lower-bound y)))
      (error "Not possible div by 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
  

(define (width x) (/ (+ (upper-bound x) (lower-bound x)) 2))

(define (make-interval a b)
  (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define one-four (make-interval 1 4))
(define neg-three-one (make-interval -3 -1))

(check-expect (add-interval one-four one-four) (make-interval 2 8))
(check-expect (sub-interval one-four one-four) (make-interval -3 3))
(check-expect (mul-interval one-four one-four) (make-interval 1 16))
(check-within (lower-bound (div-interval one-four one-four)) 0.25 0.00001)
(check-within (upper-bound (div-interval one-four one-four)) 4 0.00001)

(check-within (width one-four) 2.5 0.00001)
(check-within (width (add-interval one-four one-four)) 5 0.00001)
(check-within (width (add-interval one-four one-four)) (+ (width one-four) (width one-four)) 0.00001)
(check-within (width (add-interval one-four neg-three-one)) 0.5 0.00001)
(check-within (width (add-interval one-four neg-three-one)) (+ (width one-four) (width neg-three-one)) 0.00001)

(check-within (width (sub-interval one-four one-four)) 0 0.00001)
(check-within (width (sub-interval one-four one-four)) (- (width one-four) (width one-four)) 0.00001)
(check-within (width (sub-interval one-four neg-three-one)) 4.5 0.00001)
(check-within (width (sub-interval one-four neg-three-one)) (- (width one-four) (width neg-three-one)) 0.00001)

(check-within (width (mul-interval one-four one-four)) 8.5 0.00001)

(check-error (div-interval one-four (make-interval 0 1)) "Not possible div by 0")
(check-error (div-interval one-four (make-interval 1 0)) "Not possible div by 0")
(check-error (div-interval one-four (make-interval 0 0)) "Not possible div by 0")
(check-error (div-interval one-four (make-interval 0.0 1)) "Not possible div by 0")

(test)