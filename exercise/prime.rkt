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

;; 费马检查
(define (fast-prime? n times)
  ;; 计算乘幂的过程
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

  ;; 尝试下一个数
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  
  ;; 判断是否为偶数
  (define (even? n)
    (if (= (remainder n 2) 0)
        true
        false))
  
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


;; test
(prime? 11)
(prime? 10)
(fast-prime? 11 10)
(fast-prime? 10 10)
