#lang racket
;; 符号求导实例(未化简)

;; 求导的用到的基本过程
;; 判断是否是一个符号
(define (variable? x) (symbol? x))
;; 判断两个符号是否相等
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;; 和式的构造
(define (make-sum a1 a2) (list '+ a1 a2))
;; 乘式的构造
(define (make-product m1 m2) (list '* m1 m2))
;; 判断是否是和式
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
;; 获取和式中的被加数
(define (addend s) (cadr s))
;; 获取和式中的加数
(define (augend s) (caddr s))
;; 判断是否是乘式
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
;; 获取乘式中的被乘数
(define (multiplier p) (cadr p))
;;获取乘式中的乘数
(define (multiplicand p) (caddr p))
  
;; 求导过程
(define (deriv exp var)
  (cond ((number? exp) 0) ;; 对常数求导值为0
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp) ;; 如果是和式，就要对加数和被加数分别求导
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else (error "unknown expression type -- DERIV" exp))))

;; test
(deriv '(+ x 3) 'x)
;; 化简前 '(+ 1 0)
(deriv '(* x y) 'x)
;; 化简前 '(+ (* x 0) (* 1 y))
(deriv '(* (* x y) (+ x 3)) 'x)
;; 化简前
;; '(+
;;   (* (* x y) (+ 1 0))
;;   (* (+ (* x 0) (* 1 y)) (+ x 3)))