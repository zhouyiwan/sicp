(define nil '())
; 把当前列的第一个拿出来塞到结果里，如果当前列为空返回结果
(define (reverse lis)
  (define (inner-reverse lis res)
    (if (null? lis) res
      (inner-reverse (cdr lis) (cons (car lis) res))))
  (inner-reverse lis nil))

(display (reverse (list 1 2 3 4 5 6)))