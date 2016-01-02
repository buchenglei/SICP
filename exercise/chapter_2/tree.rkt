#lang racket
;; 层次结构
;; 我们认为对象((1 2) 3 4) 是通过下面的方式构造出来的：
;; (cons (list 1 2) (list 3 4))

(define x (cons (list 1 2) (list 3 4)))
;; 看看x是什么结构
x
;; TODO: 为什么是输出的结构，而不是((1 2)(3 4))???

;; 统计一颗树的树叶的数目
(define (count-leaves x)
  (cond ((null? x) 0)
        ;; pair? Scheme基本过程,判断x是否是序对
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves x)

;; 对树的映射
(define (scala-tree tree factor)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scala-tree (car tree) factor)
                    (scala-tree (cdr tree) factor)))))

;; 定义一个树
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

;; 看看树的实际结构
tree

(scala-tree tree 10)

;; 抽象出这一具有一般性的想法,将其中公共的模式表述为一个高阶过程
(define (map proc items)
  (if (null? items)
      null
      ;; 将上面的例子中的 * 过程换成更加一般性的过程
      (cons (proc (car items))
            (map proc (cdr items)))))

;; 使用map定义scala-tree
(define (scala-tree2 tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scala-tree2 sub-tree factor)
             (* sub-tree factor)))))

(scala-tree tree 10)