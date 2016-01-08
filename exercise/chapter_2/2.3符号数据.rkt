#lang racket
(define a 1)
(define b 2)

(list a b)
(list 'a 'b)
(list 'a b)

(car '(a b c))
(cdr '(a b c))

;; 该过程接受一个符号和表为参数
;; 如果这个符号不包含在表中，就返回假
;; 否则就返回该表的由这个符号的第一次出现开始的那个子表
(define (memq item x)
  (cond ((null? x) false)
         ((eq? item (car x)) x)
         (else (memq item (cdr x)))))

;; test
(memq 'apple '(pear banana prune))
(memq 'apple '(x (apple sauce) y apple pear))