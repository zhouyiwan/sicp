(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (union-of-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((eq? (car set1) (car set2)) (cons (car set1) (union-of-set (cdr set1) (cdr set2))))
        ((< (car set1) (car set2)) (cons (car set1) (union-of-set (cdr set1) set2)))
        (else (cons (car set2) (union-of-set set1 (cdr set2))))))

; (display (union-of-set '(1 5 7) '(0 1 2 8)))

(define (union-set tree1 tree2)
  (let ((set1 (tree->list-1 tree1))
        (set2 (tree->list-1 tree2)))
        (list->tree (union-of-set set1 set2))))

(define (intersection-of-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((or (< (car set1) (car set2)) (> (car set1) (car set2))) (intersection-of-set (cdr set1) (cdr set2)))
        (else (cons (car set1) (intersection-of-set (cdr set1) (cdr set2))))))

(define (intersection-set tree1 tree2)
  (let ((set1 (tree->list-1 tree1))
        (set2 (tree->list-1 tree2)))
        (list->tree (intersection-of-set set1 set2))))