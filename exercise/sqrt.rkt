#lang racket
;;定义精度要求
(define accuracy 0.001)

(define (sqert-iter guess x)
  (if (good-enough? guess x)
      ;; 如果猜测的结果满足精度要求了就返回
      guess
      ;; 如果不是就进入递归,使用更好的猜测
      (sqert-iter (imporve guess x)
                  x)))

(define (imporve guess x )
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) accuracy))

(define (sqrt x)
  (sqert-iter 1.0 x))

;;test
(sqrt 2)
(sqrt 4)
(sqrt 50)
(sqrt 100)