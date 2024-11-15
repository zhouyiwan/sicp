(define (adjoin-set x set)
  (cond ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(display (adjoin-set 2 '(1 3 4))) ; (1 2 3 4)
; 因为adjoin-set中在没有排序的时候需要使用element-of-set?判断是否已经存在如果排序后这个判断会快上很多
