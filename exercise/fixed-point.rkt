#lang racket
;; 找函数的不动点
;; 数x称为函数f的不动点，如果x满足方程f(x)=x
;; 从某个初始猜测出发，反复应用f
;; f(x), f(f(x)), f(f(f(x))).....
;; 非常神奇，值得深思！！！

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; test
(fixed-point cos 1.0)
;; y=siny+cosy
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

(define (average a b)
  (/ (+ a b) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt 4)

