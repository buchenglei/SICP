#lang racket
;; 基本用法，lambda是一个不带名称的过程
((lambda (x) (+ x 4)) 5)

;; 一个简单的示例，分别求两数平法，立方的和
(define (sum do a b)
  (+ (do a) (do b)))

;; 求平方
(sum (lambda (x) (* x x)) 2 3)
;; 求立方
(sum (lambda (x) (* x x x)) 2 3)

;; let的用法
;; 计算P42的过程
;; 使用过程
(define (f1 x y)
  (define (f-helper a b)
    (+ (* x (* a a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

;; 使用lambda
(define (f2 x y)
  ((lambda (a b)
     (+ (* x (* a a))
       (* y b)
       (* a b))) ;; 在这里把整个lambda表达式括起来，下面就是调用lambda的过程
   (+ 1 (* x y))
            (- 1 y)))

;; 使用let
(define (f3 x y)
  (let (;; 声明部分
        (a (+ 1 (* x y)))
        (b (- 1 y))
        )
    (+ (* x (* a a))
       (* y b)
       (* a b))))

;; test
(f1 2 3)
(f2 2 3)
(f3 2 3)

;; more about 'let'
(define (test1 x)
  (+ (let ((x 3))
       (+ x (* x 10))) x))
(test1 5)

(define (test2 x)
  (let ((x 3)
        (y (+ x 2)));; 这里的x是外面定义中的x=2，let的约束只在其body中起作用
    (* x y)));; let起作用的地方
(test2 2)