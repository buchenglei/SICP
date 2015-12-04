#lang racket/base
(define (max x y)
  (if (> x y) x y))
(define (min x y)
  (if (> x y) y x))
(define (bigger-sum x y z)
  (+ (max x y) (max (min x y) z)))
(bigger-sum 3 9 10)