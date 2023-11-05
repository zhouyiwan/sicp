(define nil '())

(define (tree-map f lis)
  (cond ((null? lis) nil)
    ((not (pair? lis)) (f lis))
    (else (cons (tree-map f (car lis)) (tree-map f (cdr lis))))))

(define (square-tree tree)
  (tree-map square tree))

(display (square-tree
  (list 1
        (list 2 (list 3 4))))); (1 (4 (9 16)))