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

(define (square x) (* x x))
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

;; 过程作为返回值
;; 牛顿法
;; 该过程描述导数的概念
(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
;; 求函数 x |-> x^3在5的导数的近似值
(define (cube x) (* x x x))
((deriv cube) 5)
;; 有了deriv之后，牛顿法就可以表述为一个求不动点的过程
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
(define (sqrt2 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(sqrt2 4)

