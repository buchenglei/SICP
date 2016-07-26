#lang racket

;; 定义基本的运算过程

(define (cube x) (* x x x))

(define (sum-integers a b)
  (if (> a b)
      0
    (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

;; 将这两个过程抽象
;; term是对于每一个数的处理过程
;; next是获取下一个要处理的数
(define  (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
      	 (sum term (next a) next b))))

(sum-integers 1 3)
(sum-cubes 1 3)

;; 适应lambda进行抽象
(define (sum-int a b)
  (sum (lambda (x) x)
       a
       (lambda (x) (+ x 1))
       b))

(define (sum-cube a b)
  (sum (lambda (x) (cube x))
       a
       (lambda (x) (+ x 1))
       b))

(sum-int 1 3)
(sum-cube 1 3)