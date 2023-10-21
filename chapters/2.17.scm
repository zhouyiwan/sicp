(define nil '())
; 如果剩下的(cdr list)是空列表就返回当前项(car list)
(define (last-pair lis)
  (define (inner-last-pair val lis)
    (if (null? lis) val
      (inner-last-pair (car lis) (cdr lis))))
  (inner-last-pair nil lis))

(display (last-pair (list 23 72 149 34)))
(newline)