#lang racket
;; 这个文件包含了2.2和2.3两道题
;; 平面上线段的表示问题
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; 线段的表示
(define (print-segment segment)
  (newline)
  (display "From:")
  (print-point (start-segment segment))
  (newline)
  (display "To:")
  (print-point (end-segment segment)))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (point x y)
  (cons x y))

;; 构造线段
(define (make-segment x1 y1 x2 y2)
  (cons (point x1 y1) (point x2 y2)))

;; 获得起点
(define (start-segment line)
  ;; return a point!
  (car line))

;; 获得终点
(define (end-segment line)
  (cdr line))

;; 中点
(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (point (/ (+ (x-point start) (x-point end)) 2)
           (/ (+ (y-point start) (y-point end)) 2))))

;; test
(display "this is 2.2 test!")
(newline)
(define test-segment (make-segment 1 1 3 3))
(print-segment test-segment)
(print-point (midpoint-segment test-segment))
(newline)
(display "--------------------")
(newline)

;; 矩形的表示
;; 其实表示矩形也就只需要两个对角线点即可描述一个矩形
(define (make-rectangle x1 y1 x2 y2)
  ;; 构造的是矩形对角线的表示，然后用这个对角线代表这个矩形
  (make-segment x1 y1 x2 y2))

;; 计算矩形的边
(define (r-long r)
  (let ((p1 (start-segment r))
        (p2 (end-segment r)))
    (- (x-point p2) (x-point p1))))

(define (r-wide r)
  (let ((p1 (start-segment r))
        (p2 (end-segment r)))
    (- (y-point p2) (y-point p1))))

;; 计算周长
(define (perimeter r)
  (+ (* (r-long r) 2) (* (r-long r) 2)))
  

;; 计算面积
(define (area r)
  (* (r-long r) (r-wide r)))

;; test
(display "this is 2.2 test!")
(newline)
(define r (make-rectangle 1 1 3 3))
(display "周长")
(newline)
(perimeter r)
(display "面积")
(newline)
(area r)
(newline)
(display "--------------------")
(newline)

  