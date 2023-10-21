(define nil '())

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list (cdr items)))))

(display (square-list (list 1 2 3 4 5)))
(newline)

(define (map f lis)
  (if (null? lis) nil
    (cons (f (car lis)) (map f (cdr lis)))))

(define (square-list2 items)
  (map square items))

(display (square-list2 (list 1 2 3 4 5)))