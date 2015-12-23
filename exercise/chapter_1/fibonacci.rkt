#lang racket
;; 按照一般方式理解的递归过程
(define (fib1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib1(- n 1))
                 (fib1(- n 2))))))

;; 这是一个线性迭代的版本
(define (fib2 n)
  (define (fib2-iter a b count)
    (if (= count 0)
        b
        (fib2-iter (+ a b) a (- count 1))))
    (fib2-iter 1 0 n))

;; test
(fib1 0)
(fib1 1)
(fib1 6)
(fib2 0)
(fib2 1)
(fib2 6)