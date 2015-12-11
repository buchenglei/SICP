#lang racket
;; 乘幂的迭代计算过程
;; 递归计算过程详见 SICP/exercise/expt.rkt
;; 计算的是b的n次方
(define (fast-expt b n)
  ;; 判断是否是偶数
  (define (even? n)
    (= (remainder n 2) 0))
  
  (define (square n)
    (* n n))
  
  ;; 迭代过程，a用于保存结果
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter b (/ n 2) (* (square b) a)))
          (else (expt-iter b (- n 1) (* b a)))))

  (expt-iter b n 1))

;; test
(fast-expt 3 2)
(fast-expt 2 10)
(fast-expt 31 24)
(fast-expt 2.5 5)