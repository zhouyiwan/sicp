(define nil '())

(define (square-tree tree)
  (cond ((null? tree) nil)
    ((not (pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(display (square-tree
  (list 1
        (list 2 (list 3 4))))); (1 (4 (9 16)))
(newline)

(define (map f lis)
  (if (null? lis) nil
    (cons (f (car lis)) (map f (cdr lis)))))

(define (square-tree2 tree)
  (map (lambda (a)
    (cond 
      ((not (pair? a)) (square a))
      (else (square-tree2 a)))) tree))

(display (square-tree2
  (list 1
        (list 2 (list 3 4))))); (1 (4 (9 16)))