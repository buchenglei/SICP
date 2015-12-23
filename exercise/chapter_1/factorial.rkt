#lang racket
;; version 1
;; 这是一个递归过程
;; 但这样的计算过程称为线性递归过程
(define (factorial-1 x)
  (if (= x 1)
      1
      (* x (factorial-1 (- x 1)))))

;; version 2
;; 这是一个递归过程
;; 但这样的计算过程是一个迭代计算过程
(define (factorial-2 x)
  ;; product用于保存最后的结果
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* product counter)
                   (+ counter 1)
                   max-count)))
  (fact-iter 1 1 x)
 )

;; version 3
;; 这个版本同version 2
;; 只不过这里不是从1到x，而是从x到1
(define (factorial-3 x)
  (define (fact-iter product x)
    (if (< x 1)
        product
        (fact-iter (* product x)
                   (- x 1))))
  (fact-iter 1 x))

;; test
(factorial-1 3)
(factorial-2 3)
(factorial-3 3)