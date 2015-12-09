#lang racket
;; 对一个给定的数计算乘幂的问题
;; 线性递归的计算过程
(define (expt-1 b n)
  (if (= n 0)
      1
      (* b (expt-1 b (- n 1)))))

;; 迭代的计算过程
(define (expt-2 b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b (- counter 1) (* b product))))
  (expt-iter b n 1))

;; test
(expt-1 2 10)
(expt-2 2 10)