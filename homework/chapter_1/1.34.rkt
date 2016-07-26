#lang racket

(define (f g)
 (g 2))

(f (lambda (a) (* a (+ a 1))))

;; f拆开到第二次就会报错，因为g最终会被替换成2
;; 但是2不是一个过程，在传递参数的时候就会报错
(f f)