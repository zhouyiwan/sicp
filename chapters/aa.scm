(define nil '())

(define (square-tree tree)
  (cond ((null? tree) nil)
    ((not (pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

; (display (square-tree
;   (list 1
;         (list 2 (list 3 4))))); (1 (4 (9 16)))

; 怎么让上面的结果反过来？
(define (square-tree-rev tree pick)
  (cond
    ((not (pair? tree)) tree)
    ((and (null? (cdr tree)) (not (pair? (car tree)))) (cons (car tree) (pick nil)))
    ((null? (cdr tree)) (cons (square-tree-rev (car tree) (lambda (a) a)) (pick nil)))
    (else (square-tree-rev
            (cdr tree)
            (lambda (a) (cons (square-tree-rev (car tree) (lambda (a) a)) (pick a)))))))

; (display (square-tree-rev (list 1 2) (lambda (a) a)))

; (display (square-tree-rev (list (list 2 3)) (lambda (a) a)))
(display (square-tree-rev
  (list 1
        (list 2 (list 3 4))) (lambda (a) a)))