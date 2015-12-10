#lang racket
;; 检查整数n是否为素数的方法

;; common
(define (square n)
  (* n n))
;; 寻找因子
(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))

  (= n (smallest-divisor n)))

;; test
(prime? 11)