#lang racket

;; let 练习
(define (square x)
  (* x x))

;; normal
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

(f 1 2)

;; lambda
(define (f1 x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(f1 1 2)

;; let expression
(define (f2 x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(f2 1 2)

;; let more
(define x 2)
(+ (let ((x 3))
     (+ x (* x 10)))
   x)

(let ((x 3)
      (y (+ x 2)))
  (* x y))