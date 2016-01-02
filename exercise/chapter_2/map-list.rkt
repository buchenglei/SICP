#lang racket
;; 对表的映射
;; 一个特别有用的操作是将某种变换应用于一个表的所有元素

(define (scala-list items factor)
  (if (null? items)
      null
      (cons (* (car items) factor)
            (scala-list (cdr items) factor))))

(scala-list (list 1 2 3 4) 10)

;; 抽象出这一具有一般性的想法，将其中公共的模式表述为一个高阶过程
(define (map proc items)
  (if (null? items)
      null
      ;; 将上面的例子中的 * 过程换成更加一般性的过程
      (cons (proc (car items))
            (map proc (cdr items)))))

(map (lambda (x) (- (* x x) 1)) (list 1 2 3 4)) 