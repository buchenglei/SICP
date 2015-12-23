#lang racket
;; 通过区间折半寻找方程f(x)=0的根

(define (average a b)
  (/ (+ a b) 2))

;; 判断a是否为负数
(define (negative? a)
  (if (< a 0)
      true
      false))
;; 判断a是否为正数
(define (positive? a)
  (if (> a 0)
      true
      false))

;; 不断缩小区间
(define (search f neg-point pos-point)
  (let (;; let声明部分
        (midpoint (average neg-point pos-point))
        )
    ;; let的body
    (if (close-enough? neg-point pos-point)
        midpoint
        ;; 继续缩小区间
        (let (
              (test-value (f midpoint))
              )
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

;; 控制精度
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "value are not of oppositive sign" a b)))))

;; test
(half-interval-method sin 2.0 4.0)
;; 用折半法找出x^3-2x-3=0在1和2之间的根
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)