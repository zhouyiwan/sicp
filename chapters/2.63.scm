(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (entry tree)
  (car tree))

(define (make-tree entry left-tree right-tree)
  (list entry left-tree right-tree))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define tree '(1 (2 (4 () ()) (6 () ())) (3 (8 () ()) (19 () ())))) 

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
             (cons (entry tree) (copy-to-list (right-branch tree) result-list)))))
  (copy-to-list tree '()))

; (display (tree->list-2 tree))
(display (tree->list-1 tree))
; (display (append '(1 2 3) '(4 5 6)))