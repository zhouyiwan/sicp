(define nil '())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(display (square-list (list 1 2 3 4))); (16 9 4 1) 元素正好相反，因为从左往右往结果里添加，自然反过来了
(newline)

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(display (square-list2 (list 1 2 3 4))); ((((() . 1) . 4) . 9) . 16) 看着顺序是对的，但是数据结构错了
(newline)
; 如果能从右往左添加就可以用迭代的方式完成操作

(define (square-list3 items)
  (define (iter things pick)
    (if (null? (cdr things))
        (pick (list (square (car things))))
        (iter (cdr things)
              (lambda (x) (pick (cons (square (car things)) x))))))
  (iter items (lambda (x) x)))

(display (square-list3 (list 1 2 3 4))); (1 4 9 16)
; 这个方式很厉害，可以通过函数的形式延迟执行，让执行顺序反过来，虽然这不是尾递归
