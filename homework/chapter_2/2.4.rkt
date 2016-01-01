#lang racket
;; 序对的另一种过程性表示
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda(p q) p)))

(define (cdr z)
  (z (lambda(p q) q)))

;; test
(define a (cons 1 2))
(car a)
(cdr a)
(newline)
(define b (cons 2 10))
(car b)
(cdr b)