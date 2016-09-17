#lang racket

(define list1 (cons (cons 1 2)
                    (cons 3 4)))

(display list1)
(newline)
(car list1)
(cdr list1)

(define list2 (cons 1
                    (cons 2
                          (cons 3
                                (cons 4 null)))))
(display list2)
(newline)
(car list2)
(cdr list2)

(define list3 (list 1 2 3 4 5))

(display list3)
