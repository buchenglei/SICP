#lang racket

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;; 构造编码树
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;; 解码算法 以一个0/1的表和一棵Huffman树为参数
(define (decode bits tree)
  (define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
          ((= bit 1) (right-branch branch))
          (else (error "bad bit  -- CHOOSE-BRANCH" bit))))
  
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))

  (decode-1 bits tree))

;; 构造一个Huffman树的示例
(define A (make-leaf 'A 8))
(define B (make-leaf 'B 3))
(define C (make-leaf 'C 1))
(define D (make-leaf 'D 1))

(define CD (make-code-tree C D))
(define BCD (make-code-tree B CD))
(define ABCD (make-code-tree A BCD))

(define (Huffman-tree-ABCD code)
  (decode code ABCD))

(define code-AC (list 0 1 1 0))
(define code-ABC (list 0 1 0 1 1 0))
(define code-ABCD (list 0 1 0 1 1 0 1 1 1))
(define code-CDA (list 1 1 0 1 1 1 0))

(Huffman-tree-ABCD code-AC)
;; '(A C)

(Huffman-tree-ABCD code-ABC)
;; '(A B C)

(Huffman-tree-ABCD code-ABCD)
;; '(A B C D)

(Huffman-tree-ABCD code-CDA)
;; '(C D A)
