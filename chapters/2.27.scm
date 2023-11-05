(define nil '())

(define (deep-reverse items)
  (define (inner-deep-reverse items result)
    (cond ((null? items) result)
          ((not (pair? items)) items)
          (else (inner-deep-reverse
                  (cdr items) 
                  (cons (inner-deep-reverse (car items) nil) result)))))
  (inner-deep-reverse items nil))

(display (deep-reverse (list 1 '(2 3) '(4 5)))); 将后面的元素倒过来倒前面来，同时将颠倒的元素也要颠倒一下