#lang racket
;; 高阶函数的实例
;; 抽象过程是非常重要的
;; 这是一些值得深思熟虑的代码

;; sum是一个高阶函数
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; 被高阶函数调用的过程

;; 公共部分
(define (identity x) x)
(define (inc n) (+ n 1))
(define (cube n) (* n n n))

;; 计算从1到10的立方和
(define (sum-cubes a b)
  (sum cube a inc b))

;; 计算从1到10的整数和
(define (sum-integers a b)
  (sum identity a inc b))

;; 计算π的近似值
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))


;; test
(sum-cubes 1 10)
(sum-integers 1 10)
(* 8 (pi-sum 1 1000))