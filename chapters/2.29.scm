(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define mobile (make-mobile
  (make-branch 10 (make-mobile (make-branch 10 10) (make-branch 12 9)))
  (make-branch 12 (make-mobile (make-branch 10 10) (make-branch 12 9)))))

(define (total-weight mobile)
  (let ((left-structure (branch-structure (left-branch mobile)))
      (right-structure (branch-structure (right-branch mobile))))
      (cond
        ((and (not (pair? left-structure)) (not (pair? right-structure))) (+ left-structure right-structure))
        ((and (not (pair? left-structure)) (pair? right-structure)) (+ left-structure (total-weight right-structure)))
        ((and (pair? left-structure) (not (pair? right-structure))) (+ (total-weight left-structure) right-structure))
        (else (+ (total-weight left-structure) (total-weight right-structure))))))

; (display (total-weight mobile))

(define (balance mobile)
  (if (not (pair? mobile)) (cons #t mobile)
  (let (
    (left-structure (branch-structure (left-branch mobile)))
    (left-length (branch-length (left-branch mobile)))
    (right-structure (branch-structure (right-branch mobile)))
    (right-length (branch-length (right-branch mobile)))
    (left-structure-balance (balance (branch-structure (left-branch mobile))))
    (right-structure-balance (balance (branch-structure (right-branch mobile)))))
  (cond
    ((and (and (car left-structure-balance) (car right-structure-balance)) 
          (eq? (* left-length (cdr left-structure-balance)) (* right-length (cdr right-structure-balance))))
     (cons #t (+ (cdr left-structure-balance) (cdr right-structure-balance))))
    (else (cons #f 0))
  ))
))

(define a (make-mobile 
  (make-branch 10 (make-mobile (make-branch 10 10) (make-branch 10 10))) 
  (make-branch 20 (make-mobile (make-branch 2 5) (make-branch 2 5)))))

(display (balance a))

; 如果构造mobile和branch的方式由list改为cons需要改的地方也只有right-branch和right-structure这两个方法，只用cdr即可，这就是抽象层次，和抽象数据结构的好处