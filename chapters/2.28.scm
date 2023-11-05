(define nil '())

(define my-tree (list 1 (list 2 (list 3 4) (list 5 6)) (list 7 (list 8))))

; 后序遍历
(define (fringe tree)
  (define (inner-fringe tree res)
    (cond
      ((null? tree) res)
      ((not (pair? tree)) (cons tree res))
      (else (inner-fringe (car tree) (inner-fringe (cdr tree) res)))))
  (inner-fringe tree nil))

; (display (fringe my-tree))

; (define (fringe2 tree)
;   (define (inner-fringe2 tree res)
;     (cond ((null? tree) res)
;       ((not (pair? tree)) (cons tree res))
;       (else (inner-fringe2 (cdr tree) (inner-fringe2 (car tree) res)))))
;   (inner-fringe2 tree nil))

; (display (fringe2 my-tree))

(define (abc items)
  (define (inner-abc items)
    (if (null? items) nil
      (cons (car items) (inner-abc (cdr items)))))
  (inner-abc items))

5

(define (abc3 items)
  (define (inner-abc items pick)
    (cond ((null? items) nil)
      ((null? (cdr items)) (pick (cons (car items) nil)))
      (else (inner-abc (cdr items) (lambda (res) (pick (cons (car items) res)))))
      ))
  (inner-abc items (lambda (res) res) ))

(display (abc3 (list 10 1 2 3)))

(define (abc2 items)
  (define (inner-abc items res)
    (if (null? items) res
      (inner-abc (cdr items) (cons (car items) res))))
  (inner-abc items nil))

; (display (abc2 (list 10 1 2 3)))
