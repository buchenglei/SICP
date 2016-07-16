#lang racket
;分别使用递归和迭代的计算方式实现给定数的计算乘幂的问题

;判断n是否为偶数
(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

;线性递归计算过程
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;线性迭代计算过程
(define (fast-expt2 b n)
  (define (iter a b n)
    ;这里的a保留了在n为奇数时拆出的底数b
    (cond ((= n 1) (* a b))
          ;如果n为偶数，那么a不变，b平方，指数除以2
          ((even? n) (iter a (square b) (/ n 2)))
          ;n为奇数的时候，拆出一个b累成到a中，并将n-1，变成偶数
          (else (iter (* a b) b (- n 1)))))

  (if (= n 0)
      1
      (iter 1 b n)))

(fast-expt 2 4)
(fast-expt2 2 4)

(fast-expt 3 3)
(fast-expt2 3 3)

(fast-expt 2 10)
(fast-expt2 2 10)