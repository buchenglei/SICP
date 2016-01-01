#lang racket
;; Scheme提供了一个基本的操作来构造表
(list 1 2 3 4)

;; 使用序对cons可以实现一样的操作
(cons 1
      (cons 2
            (cons 3
                  ;; 注意在Racket中并不支持Scheme中的nil
                  ;; 可以考虑使用null和empty代替
                  (cons 4 null))))

;; !!!注意(list 1 2 3 4)和(1 2 3 4)是完全不同的概念

;; 定义一个测试的list
(define example (list 1 2 3 4))

;; 表的操作
;; 给定一个数，返回表中该位置的值
;; list的index值从0开始
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref example 2)
(list-ref example 3)

;; 获取表的长度(递归)
(define (length1 items)
  ;; 判断表是否为空
  (if (null? items)
      0
      (+ 1 (length1 (cdr items)))))

(length1 example)

;; 获取表的长度(迭代)
(define (length2 items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(length2 example)

;; 将两个表合并成一个新表
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append example example)