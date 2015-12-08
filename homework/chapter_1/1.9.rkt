#lang racket
(define (inc num)
  (+ num 1))
(define (dec num)
  (- num 1))

;; process A 
(define (plus1 a b)
  (if (= a 0)
      b
      (inc (plus1 (dec a) b))))

;; process B
(define (plus2 a b)
  (if (= a 0)
      b
      (plus2 (dec a) (inc b))))

;; 书上是重新定义的+的运算过程，
;; 为了方便查看和理解，将所有的+改成了plus
;; 值得注意的是,他们都是递归的过程，但是
;; plus1使用的是迭代的计算过程
;; plus2使用的是线性递归的计算过程
(plus1 4 5)
(plus2 4 5)