#lang racket
(define (sqrt x)
  ;;定义精度要求
  (define accuracy 0.001)
  ;; 定义迭代过程
  (define (sqert-iter guess x)
    (if (good-enough? guess x)
      ;; 如果猜测的结果满足精度要求了就返回
      guess
      ;; 如果不是就进入递归,使用更好的猜测
      (sqert-iter (imporve guess x)
                  x)))
  ;; 获得更好的猜测
  (define (imporve guess x )
    (average guess (/ x guess)))

  ;; 求平均值
  (define (average x y)
    (/ (+ x y) 2))

  ;; 求平方
  (define (square x)
    (* x x))

  ;; 判断当前的猜测是否返祖当前精度要求
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) accuracy))

  ;; 迭代开始的地方
  ;; 这里是调用过程的地方，
  ;; 在过程内部定义过程
  ;; 这个调用一定要放在最后的位置
  (sqert-iter 1.0 x)
)

;;test
(sqrt 2)
(sqrt 4)
(sqrt 50)
(sqrt 100)