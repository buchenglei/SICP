#lang racket
;; 基本过程
;; 求第n个斐波那契数
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
    (fib-iter 1 0 n))

;; 求平方
(define (square x) (* x x))

;; 判断奇偶性
(define (odd? x)
  (not (= (remainder x 2) 0)))
(define (even? x)
  (= (remainder x 2) 0))

;; 将两个表合并成一个新表
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;; 判断是否为素数
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

;; 一颗用于测试的树
(define test-tree (list 1
                        (list 2
                              (list 3 4)
                              5)
                        (list 6 7)))


;; 先来看看两个一般性的例子
;; 1、计算值为奇数的叶子的平方和
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         ;; 不是序对是当成一般的数值处理
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
;; test
(sum-odd-squares test-tree)

;; 2、构造出所有偶数的斐波那契数fib(k)的表
;; k是小于等于n的一个整数
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        null
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))
;;test
(even-fibs 10)

(newline)

;; 对这两个计算过程进行抽象
;; 映射
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

;; 筛选需要的值
(define (filter predicate items)
  (cond ((null? items) null)
        ((predicate (car items))
         (cons (car items)
               (filter predicate (cdr items))))
        (else (filter predicate (cdr items)))))
        
;; 累积
(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))

;; 获取每一个值
(define (enumerate-interval low heigh)
  (if (> low heigh)
      null
      (cons low (enumerate-interval (+ low 1) heigh))))

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;; 重新实现刚开始的两个例子
(define (sum-odd-squares2 tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                          (enumerate-tree tree)))))
;; test
(sum-odd-squares2 test-tree)

(define (even-fibs2 n)
  (accumulate cons
              null
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))
;; test
(even-fibs2 10)

(newline)

;; 嵌套映射
;;(accumulate append
;;            null
;;            (map (lambda (i)
;;                   (map (lambda(j) (list i j))
;;                        (enumerate-interval 1 (- i 1))))
;;                 (enumerate-interval 1 6)))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
 (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-paires n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda(j) (list i j))
                       (enumerate-interval 1 (- i 1))))
               (enumerate-interval 1 n)))))
;; test
(prime-sum-paires 6)