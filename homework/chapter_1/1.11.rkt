#lang racket
;; 采用递归计算过程计算f的过程
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3))))))

;; 采用迭代计算过程计算f的过程
(define (f2 n)
  (define (f2-iter a b c count)
    (if (= count 0)
        c
        (f2-iter (+ a (* 2 b) (* 3 c))
                    a
                    b
                    (- count 1))))
  (f2-iter 2 1 0 n))


;; test
(f1 0)
(f1 1)
(f1 2)
(f1 3)
(f1 4)
(f1 5)
(f1 6)

(f2 0)
(f2 1)
(f2 2)
(f2 3)
(f2 4)
(f2 5)
(f2 6)