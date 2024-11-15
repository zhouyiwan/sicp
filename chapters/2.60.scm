(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        (else (cons (car set1) (union-set (cdr set1) set2)))))

(display (intersection-set '(1 2 2 3) '(2 3 4))) ; (1 2 3 4)

; 联合的操作比较多的时候会使用这个方式，不用在每次操作的时候校验是否唯一
